<?php
$method = $viewData['method'];
?>
<div style="text-align: center; min-width: <?php echo $viewData['method']->frame_w; ?>">
    <iframe id="<?php echo $viewData['iframe_id']; ?>" style="<?php echo $viewData['method']->box_style; ?>"
            scrolling='no' marginheight='0' marginwidth='0' frameborder='0'
            width='<?php echo $viewData['method']->frame_w; ?>' height='<?php echo $viewData['method']->frame_h; ?>'></iframe>
</div>
<?php
$js_args = array(
    $method->box_id,
    $viewData['coinName'],
    $method->public_key,
    $viewData['amount'],
    $viewData['amount_usd'],
    $viewData['expiry'],
    $method->locale,
    $viewData['iframe_id'],
    $viewData['user_id'],
    $viewData['user_format'],
    $viewData['order_bt']->virtuemart_order_id,
    $viewData['cookie_name'],
    $method->webdev_key,
    $viewData['hash'],
    $viewData['method']->frame_w,
    $viewData['method']->frame_h
);
$js_str = array();
foreach ($js_args as $v){
    if(is_numeric($v)){
        $js_str[] = $v;
    } else {
        $js_str[] = "'" . $v . "'";
    }
}
$locale_strings =CryptoCoinHelper::locale_signs($method->locale);
$button_text = str_replace(
    array("%coinName%", "%coinNames%", "%coinLabel%"),
    array($viewData['coinName'], ($viewData['coinLabel']=='DASH'?$viewData['coinName']:$viewData['coinName'].'s'), $viewData['coinLabel']),
    $locale_strings['button']);
?>
<div>
    <script type="text/javascript">
        cryptobox_show(<?php echo implode(', ', $js_str); ?>);
    </script>
</div>
<div >
    <form action="<?php echo JUri::getInstance()->toString() ?>#c<?php echo $viewData['iframe_id']; ?>">
        <input type="hidden" name="cryptobox_live_" id="cryptobox_live_" value="<?php echo $viewData['form_value']; ?>">
        <button <?php if (in_array($method->locale, array("ar", "fa"))) echo 'dir="rtl"'; ?>
            style="<?php echo $method->button_style; ?>">
            &#160; <?php echo $button_text; ?> &#160;

        </button>
    </form>
</div>