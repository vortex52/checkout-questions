<?php

if (!defined('BOOTSTRAP')) {die('Access denied');}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    if ($mode == 'add') {
        $params = $_REQUEST['rq_data'];
        fn_sd_checkout_questions_add_question($params);
    }

    if ($mode == 'update') {
        $params = $_REQUEST['rq_data'];
        $id = $_REQUEST['id'];
        fn_sd_checkout_questions_update_question($params, $id);
    }
    
    if ($mode == 'm_update') {
        $params = $_REQUEST['rq_data'];
        fn_sd_checkout_questions_mass_update_questions($params);
    }

    if ($mode == 'delete') {
        fn_sd_checkout_questions_delete_question($_REQUEST['id']);
    }

    return array(CONTROLLER_STATUS_OK, 'checkout_questions.manage');
}

if ($mode == 'manage') {
    $checkout_questions = fn_sd_checkout_questions_get_all();    
    Tygh::$app['view']->assign('form_types', FORM_TYPES);
    Tygh::$app['view']->assign('checkout_questions', $checkout_questions);
}

if ($mode == 'edit') {
    $question = fn_sd_checkout_questions_get_question($_REQUEST['id']);    
    Tygh::$app['view']->assign('form_types', FORM_TYPES);
    Tygh::$app['view']->assign('question', $question);
}
