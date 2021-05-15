<?php

if (!defined('BOOTSTRAP')) {die('Access denied');}

fn_register_hooks(    
    'place_order',
    'checkout_place_order_before_check_amount_in_stock'
);
