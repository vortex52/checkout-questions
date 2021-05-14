<?php

$schema['checkout_questions'] = array(
    'class' => '\Tygh\Addons\SdCheckoutQuestions\Documents\Order\CheckoutQuestionsVariable',
    'arguments' => array('#context', '@formatter'),
);

return $schema;