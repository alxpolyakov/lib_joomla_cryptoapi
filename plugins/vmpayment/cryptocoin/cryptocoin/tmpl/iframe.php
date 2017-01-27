<?php
$method = $viewData['method'];
?>
<div style="text-align: center; min-width: <?php echo $viewData['method']->frame_w; ?>">
    <iframe id="<?php echo $viewData['iframe_id']; ?>" style="<?php echo $viewData['method']->box_style; ?>"
            scrolling='no' marginheight='0' marginwidth='0' frameborder='0'
            width='<?php echo $viewData['method']->frame_w; ?>' height='<?php echo $viewData['method']->frame_h; ?>'></iframe>
</div>
cookie_name:<?php var_dump($viewData['cookie_name']); ?>
<script type="text/javascript">
    cryptobox_show('<?php echo $method->box_id; ?>', '<?php echo $viewData['coinName'] ?>',
        '<?php echo $method->public_key?>', <?php echo $viewData['amount']; ?>, <?php echo $viewData['amount_usd']; ?>,
    '<?php echo $viewData['expiry']; ?>', '<?php echo $method->locale; ?>', '<?php echo $viewData['iframe_id'] ?>',
    '<?php echo $viewData['user_id'] ?>', 'MANUAL', '<?php echo $viewData['order_bt']->virtuemart_order_id ?>',
    '<?php $viewData['cookie_name']; ?>', '<?php echo $method->webdev_key; ?>', '<?php echo $viewData['hash'] ?>',
        <?php echo $viewData['method']->frame_w; ?>, <?php echo $viewData['method']->frame_h; ?>)
</script>