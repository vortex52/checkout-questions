<?php

if (!defined('BOOTSTRAP')) {die('Access denied');}

fn_register_hooks(
    'checkout_place_orders_pre_route',
    'mailer_send_pre'
);
