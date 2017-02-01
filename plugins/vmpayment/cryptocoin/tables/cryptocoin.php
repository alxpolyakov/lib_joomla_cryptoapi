<?php

class TableCryptoCoin extends JTable{
    public function __construct(&$db)
    {
        parent::__construct('#__virtuemart_payment_plg_cryptocoin', 'id', $db);
    }
}