<?php

namespace Tygh\Addons\SdCheckoutQuestions\Documents\Order;

use Tygh\Template\Document\Order\Context;
use Tygh\Template\IVariable;
use Tygh\Tygh;

/**
 * Class CheckoutQuestionsVariable
 * @package Tygh\Addons\SdCheckoutQuestions\Documents\Order
 */
class CheckoutQuestionsVariable implements IVariable
{
    public $questions;  

    /**
     * CheckoutQuestionsVariable constructor.
     *
     * @param Context $context Instance of order invoice context.
     */
    public function __construct(Context $context)
    {
        $order = $context->getOrder();
        $view  = Tygh::$app['view'];

        $data = fn_sd_checkout_questions_get_order_questions($order->getId());
        $view->assign('questions', $data);
        $this->questions = $view->displayMail('addons/sd_checkout_questions/table.tpl', false, 'A', null, 'ru');
    }
}
