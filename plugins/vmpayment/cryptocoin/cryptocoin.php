<?php
/**
 * @copyright	Copyright (c) 2017 alx (http://alx.com). All rights reserved.
 * @license		http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 */

// no direct access
defined('_JEXEC') or die;

jimport('joomla.plugin.plugin');

/**
 * vmpayment - cryptocoin Plugin
 *
 * @package		Joomla.Plugin
 * @subpakage	alx.cryptocoin
 */
JFormHelper::addFieldPath(JPATH_ROOT . '/plugins/vmpayment/cryptocoin/fields');
if (!class_exists ('vmPSPlugin')) {
    require(JPATH_VM_PLUGINS . DS . 'vmpsplugin.php');
}
if(!class_exists('CryptoCoinHelper')){
    require __DIR__ .'/helper.php';
}

class plgvmpaymentcryptocoin extends vmPSPlugin {

    private $version = '0.0.1';


	/**
	 * Constructor.
	 *
	 * @param 	$subject
	 * @param	array $config
	 */
	function __construct(&$subject, $config = array()) {

		// call parent constructor
		parent::__construct($subject, $config);
        $lang = JFactory::getLanguage ();
        $lang->load ('plg_vmpayment_cryptocoin', JPATH_ADMINISTRATOR, NULL, TRUE);
        $this->_loggable = TRUE;
        $this->tableFields = array_keys ($this->getTableSQLFields());
        $this->_tablename = '#__virtuemart_' . $this->_psType . '_plg_' . $this->_name;
        $this->_tablepkey = 'id';
        $this->_tableId = 'id';
        $varsToPush = $this->getVarsToPush();
        $this->setConfigParameterable ($this->_configTableFieldName, $varsToPush);

	}

    /**
     *  @return string
     */
    public function getVmPluginCreateTableSQL () {
        return $this->createTableSQL('Payment CryptoCoin');
    }

    public function getTableSQLFields(){
        $fields = array(
            'id' => "int(11) UNSIGNED NOT NULL AUTO_INCREMENT" ,
            'box_id' => "int(11) UNSIGNED NOT NULL DEFAULT '0'" ,
            'box_type' => "enum('paymentbox','captchabox') NOT NULL" ,
            'virtuemart_order_id'	=> 'int(1) UNSIGNED',
            'order_number'			=> 'char(64)',
            'payment_name' => 'varchar(255)',
            'payment_currency' => 'tinyint(4)',
            'user_id' => "int(11) NOT NULL DEFAULT '0'" ,
            'country_code' => "varchar(3) NOT NULL DEFAULT ''" ,

            'coin_label' => "varchar(6) NOT NULL DEFAULT ''" ,
            'amount' => "double(20,8) NOT NULL DEFAULT '0.00000000'" ,
            'amount_usd' => "double(20,8) NOT NULL DEFAULT '0.00000000'" ,
            'unrecognised' => "tinyint(1) UNSIGNED NOT NULL DEFAULT '0'" ,
            'addr' => "varchar(34) NOT NULL DEFAULT ''" ,
            'tx_id' => "char(64) NOT NULL DEFAULT ''" ,
            'tx_date' => "datetime DEFAULT NULL" ,
            'tx_confirmed' => "tinyint(1) UNSIGNED NOT NULL DEFAULT '0'" ,
            'tx_check_date' => "datetime DEFAULT NULL" ,
            'processed' => "tinyint(1) UNSIGNED NOT NULL DEFAULT '0'" ,
            'processed_date' => "datetime DEFAULT NULL" ,
            'created' => "datetime DEFAULT NULL",

            'cost_per_transaction' => 'decimal(10,2)',
            'cost_percent_total' => 'decimal(10,2)',

        );

        return $fields;
    }

    public function getVarsToPush () {
        return self::getVarsToPushByXML($this->_xmlFile,$this->_name.'Form');
    }

    function plgVmSetOnTablePluginParamsPayment ($name, $id, &$table) {
        return $this->setOnTablePluginParams ($name, $id, $table);
    }

    function plgVmDeclarePluginParamsPaymentVM3( &$data) {
        return $this->declarePluginParams('payment', $data);
    }

    public function plgVmDisplayListFEPayment (VirtueMartCart $cart, $selected = 0, &$htmlIn) {
        return $this->displayListFE ($cart, $selected, $htmlIn);
    }
    /**
     * This will install database table
     */
    function plgVmOnStoreInstallPaymentPluginTable($jplugin_id)
    {
        return $this->onStoreInstallPluginTable($jplugin_id);
    }

    protected function checkConditions ($cart, $method, $cart_prices) {
        $this->convert_condition_amount($method);
        $amount = $this->getCartAmount($cart_prices);
        $amount_cond = ($amount >= $method->min_amount AND $amount <= $method->max_amount
            OR
            ($method->min_amount <= $amount AND ($method->max_amount == 0)));
        return $amount_cond;
    }

    public function plgVmOnSelectCheckPayment (VirtueMartCart $cart,  &$msg) {
        return $this->OnSelectCheck ($cart);
    }

    public function plgVmonSelectedCalculatePricePayment (VirtueMartCart $cart, array &$cart_prices, &$cart_prices_name) {

        return $this->onSelectedCalculatePrice ($cart, $cart_prices, $cart_prices_name);
    }

    function plgVmgetPaymentCurrency($virtuemart_paymentmethod_id, &$paymentCurrencyId)
    {
        if (!($method = $this->getVmPluginMethod($virtuemart_paymentmethod_id))) {
            return NULL;
        }
        if (!$this->selectedThisElement($method->payment_element)) {
            return FALSE;
        }
        $this->getPaymentCurrency($method);

        $paymentCurrencyId = $method->payment_currency;

        return;
    }

    function plgVmOnCheckAutomaticSelectedPayment(VirtueMartCart $cart, array $cart_prices = array(), &$paymentCounter)
    {
        return $this->onCheckAutomaticSelected($cart, $cart_prices, $paymentCounter);
    }

    public function plgVmOnShowOrderFEPayment($virtuemart_order_id, $virtuemart_paymentmethod_id, &$payment_name)
    {
        $this->onShowOrderFE($virtuemart_order_id, $virtuemart_paymentmethod_id, $payment_name);
    }

    public function plgVmOnCheckoutCheckDataPayment(VirtueMartCart $cart)
    {
//        var_dump(__FILE__.':'.__LINE__);
    }

    function plgVmonShowOrderPrintPayment($order_number, $method_id)
    {
        return $this->onShowOrderPrint($order_number, $method_id);
    }

    /**
     *
     * @param $cart
     * @param $order
     * @return bool|null|void
     */
    function plgVmConfirmedOrder($cart, $order) {
        JFactory::getDocument()->addScript('plugins/vmpayment/cryptocoin/assets/js/cryptobox.js');
        $method = $this->getVmPluginMethod($cart->virtuemart_paymentmethod_id);

        $db = JFactory::getDbo();
        $db->setQuery(
            $db->getQuery(true)->select('*')->from($this->_tablename)
                ->where('virtuemart_order_id='.(int)$order['details']['BT']->virtuemart_order_id)
        );

        $user_id = JFactory::getUser()->guest ? 'user_order_' .$order['details']['BT']->virtuemart_order_id : JFactory::getUser()->id;
        $iframe_id = 'box' . CryptoCoinHelper::icrc32($method->box_id."__".
                (int)$order['details']['BT']->virtuemart_order_id."__".$user_id."__".$method->private_key);

        $c = substr(CryptoCoinHelper::right(CryptoCoinHelper::left($method->public_key, "PUB"), "AA"), 5);
        $coinLabel = CryptoCoinHelper::right($c, "77");
        $coinName = CryptoCoinHelper::left($c, "77");

        $currency_code_3 = shopFunctions::getCurrencyByID ($method->payment_currency, 'currency_code_3');
        if ($currency_code_3 != 'USD'){
            $amount_usd = CryptoCoinHelper::convert_currency_live($currency_code_3, 'USD', $order['details']['BT']->order_total);
        } else {
            $amount_usd = $order['details']['BT']->order_total;
        }

        $amount_usd = rtrim(rtrim($amount_usd, "0"), ".");
        $amount_coins = 0;

        $row = $db->loadObject();
        if (!$row){
            $data = array(
                'virtuemart_order_id' =>(int)$order['details']['BT']->virtuemart_order_id,
                'order_number' => $order['details']['BT']->order_number,
                'user_id' => $user_id,
                'coin_label' => $coinLabel,
                'amount' => $amount_coins,
                'amount_usd' => $amount_usd,
                'unrecognised' => -1,
                'created_on' => JFactory::getDate()->toSql(),
                'payment_name' => $method->payment_name
            );
            $this->storePluginInternalData($data);
        }
//        var_dump($this->_tablename, $this->_tablepkey);

        $this->getPaymentCurrency ($method);


        $expiry = 'NOEXPIRY';

        $hash_data = array(
            $method->box_id,
            $coinName,
            $method->public_key,
            $method->private_key,
            $method->webdev_key,
            $amount_coins, //$this->amount,
            'NOEXPIRY', //$this->period,
            $amount_usd,
            $method->locale,
            $amount_coins,
            $iframe_id,
            $amount_usd,
            $user_id,
            'MANUAL',
            $order['details']['BT']->virtuemart_order_id,
            $method->frame_w,
            $method->frame_h,
        );
        $hash = md5(implode('', $hash_data));
        $html = array();
        $form_value = md5($iframe_id . $method->private_key. $user_id);

        $html[]=$this->renderByLayout('iframe',
            array('method' => $method,
                'order_bt'=>$order['details']['BT'],
                'iframe_id' => $iframe_id,
                'amount'=>$amount_coins,
                'amount_usd' => $amount_usd,
                'expiry' => $expiry,
                'user_id' => $user_id,
                'cookie_name' => 'cryptoUser'. CryptoCoinHelper::icrc32($method->private_key
                        ."*&*".$method->box_id."*&*".$method->box_coin."*&*"
                        .$order['details']['BT']->virtuemart_order_id),
                'hash' => $hash, 'coinLabel' => $coinLabel, 'coinName' => $coinName,
                'form_value' => $form_value,
                'user_format' => 'MANUAL'
            )
        );

        vRequest::setVar('html', implode('', $html));
//        $cart = VirtueMartCart::getCart ();
        $cart->emptyCart ();

        return TRUE;
    }

    function plgVmOnPaymentNotification(){

        $input = JFactory::getApplication()->input;
        if($input->server->get('REQUEST_METHOD') != 'POST'){
            die('Only POST Data Allowed');
        }
        $keys = array("status", "err", "private_key", "box", "boxtype", "order", "user", "usercountry",
        "amount", "amountusd", "coinlabel", "coinname", "addr", "tx", "confirmed", "timestamp", "date", "datetime");
        $data = array();
        foreach($keys as $k){
            $data[$k] = $input->post->get($k);
        }

        var_dump($data);


        if (!in_array($data['status'], array("payment_received", "payment_received_unrecognised"))){
            die('invalid status');
        }
        $db = JFactory::getDbo();
        $db->setQuery($db->getQuery(true)->select('*')
                ->from($this->_tablename)
                ->where('virtuemart_order_id='.(int)$data['order']));
        $row = $db->loadObject();
        if(!$row){
            die('Plugin db record not found');
        }

        $db->setQuery($db->getQuery(true)->select('*')
            ->from('#__virtuemart_orders')
            ->where('virtuemart_order_id='.(int)$data['order']));

        $order = $db->loadObject();
        if(!$order){
            die('Order not found');
        }

        $fp = fopen(JFactory::getApplication()->get('tmp_path').'/inuital-data-'.$order->virtuemart_order_id.'.json', 'w');
        fwrite($fp, json_encode($data));
        fclose($fp);

        $method = $this->getVmPluginMethod($order->virtuemart_paymentmethod_id);
        if($method->private_key != $data['private_key']){

            die('Incorrect key');
        }
        if($data['status'] == 'payment_received'){
            $row->country_code = $data['usercountry'];
            $row->amount = $data['amount'];
            if($row->amount_usd != $data['amountusd']){
                die('Incorrect amount USD');
            }
            $row->addr = $data['addr'];
            $row->tx_id = $data['tx'];
            $row->confirmed = $data['confirmed'];

            //.$this->private_key.$this->userID.$this->orderID.$this->language.$this->period.$ip
            $check_data = array(
                'private_key' => $method->private_key,
                'box_id' => $method->box_id,
                'order_id' => $order->virtuemart_order_id,
                'user_id' => $order->virtuemart_user_id ? $order->virtuemart_user_id : 'user_order_' . $order->virtuemart_order_id,
                'period' =>'NOEXPIRY',
                'language' =>$method->locale,
                'ip' => CryptoCoinHelper::ip_address()
            );
            $keys_match = array('b' => 'box_id', 'r' => 'private_key',  'u'=>'user_id',
                 'o'=>'order_id', 'l' => 'language', 'e' => 'period', 'i' => 'ip', 'h'=>'hash');

            $post_data = array();
            foreach($keys_match as $k=>$v){
                if (isset($check_data[$v])){
                    $post_data[$k] = $check_data[$v];
                }
            }

            $post_data['h'] = md5(implode('', array_values($post_data)));

            $fp = fopen(JFactory::getApplication()->get('tmp_path').'/post-'.$order->virtuemart_order_id.'.json', 'w');
            fwrite($fp, json_encode($post_data));
            fclose($fp);

            $resp = CryptoCoinHelper::check_payment($post_data);
            $fp = fopen(JFactory::getApplication()->get('tmp_path').'/response-'.$order->virtuemart_order_id.'.json', 'w');
            fwrite($fp, json_encode($resp));
            fclose($fp);
            var_dump($resp);
            if(!is_object($resp) && !is_array($resp)){
                die('Invalid response');
            }
            $resp = (object)$resp;
            $row->addr = $resp->addr;
            $row->amount = $resp->amount;
            $row->confirmed = $resp->confirmed;
//            $row->processed_date = JFactory::getDate($resp->timestamp);
            $row->tx_id = $resp->tx;
            $row->tx_date = JFactory::getDate($resp->timestamp)->toSql();
            $row->modified_on = JFactory::getDate()->toSql();
            $this->storePluginInternalData($data);

            $tbl = $this->createPluginTableObject($this->_tablename, $this->tableFields, $row->id, $this->_tablepkey);
            $tbl->bindChecknStore($row);
            $sql = $db->getQuery(true)->select('count(*) as cnt')->from($this->_tablename)->where('addr='.$db->quote($resp->addr));
            $db->setQuery($sql);
            $num_payments = $db->loadObject();
            $order_status = '';
            if(is_object($num_payments)){
                if($num_payments->cnt > 1){
                    $order_status = $method->order_status_success_next;
                } elseif ($num_payments->cnt == 1){
                    $order_status = $method->order_status_success_first;
                }

                $db->setQuery(
                    $db->getQuery(true)->update('#__virtuemart_orders')
                        ->set('order_status='.$db->quote($order_status))
                        ->where('virtuemart_order_id='.(int)$order->virtuemart_order_id)
                );
                $db->execute();

            }

        }
    }

}
