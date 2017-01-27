<?php

defined('JPATH_BASE') or die();

jimport('joomla.form.formfield');

class JFormFieldNotifyURL extends JFormField {

    var $type = 'NotifyURL';
    var $class = 'NotifyURL level3';

    protected function getInput() {
        $cid = vRequest::getvar('cid', NULL, 'array');
        if (is_array($cid)) {
            $virtuemart_paymentmethod_id = $cid[0];
        } else {
            $virtuemart_paymentmethod_id = $cid;
        }
        JFactory::getDocument()->addStyleSheet('/plugins/vmpayment/cryptocoin/assets/css/style.css');

        $http = JURI::root() . 'index.php?option=com_virtuemart&view=vmplg&task=notify&nt=ipn&tmpl=component&pm=' . $virtuemart_paymentmethod_id;
        $https = str_replace('http://', 'https://', $http);

        $string = '<div class="' . $this->class . '">';
        $string .= '<div class="">' . $https . ' <br /></div>';
        if (strcmp($https,$http) !==0){
            $string .= '<div class="ipn-sandbox">' . vmText::_('OR') . '<br />';
            $string .= $http. '</div>';
        }
        $string .= "</div>";
        return $string;
    }
}