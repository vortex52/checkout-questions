<?php

if (!defined('BOOTSTRAP')) {die('Access denied');}

/**
 * Add new question
 *
 * @param  array $params question fields
 *
 * @return array
 */
function fn_sd_checkout_questions_add_question($params)
{
    $params = fn_sd_checkout_questions_serialize_select_type($params);

    db_query('INSERT INTO ?:checkout_questions ?e', $params);
}

/**
 * Uppate question
 *
 * @param  array $params question fields
 * @param int $id  quesion id
 */
function fn_sd_checkout_questions_update_question($params, $id)
{
    $params = fn_sd_checkout_questions_serialize_select_type($params);

    db_query('UPDATE ?:checkout_questions SET ?u WHERE id = ?i', $params, $id);
}

/**
 * Update position parametrs
 *
 * @param  array $params question fields
 */
function fn_sd_checkout_questions_mass_update_questions($params)
{
    foreach ($params as $key => $value) {
        db_query('UPDATE ?:checkout_questions SET position = ?i WHERE id = ?i', $value['position'], $key);
    }
}

/**
 * Get all questions sort by position
 *
 * @return array
 */
function fn_sd_checkout_questions_get_all()
{
    $questions = db_get_array('SELECT * FROM ?:checkout_questions ORDER BY position');
    return $questions;
}

/**
 * Delete question
 *
 * @param int $id  quesion id
 */
function fn_sd_checkout_questions_delete_question($id)
{
    db_query('DELETE FROM ?:checkout_questions WHERE id = ?i', $id);
}

/**
 * Get question by id
 *
 * @param int $id  quesion id
 *
 * @return array
 */
function fn_sd_checkout_questions_get_question($id)
{
    $question = db_get_row("SELECT * FROM ?:checkout_questions WHERE id = ?i", $id);
    if ($question['select_type']) {
        $question['select_type'] = implode(',', unserialize($question['select_type']));
    }
    return $question;
}

/**
 * Get user answer
 *
 * @param int $order_id
 *
 * @return array
 */
function fn_sd_checkout_questions_get_order_questions($order_id)
{
    $question = db_get_field("SELECT checkout_questions FROM ?:orders WHERE order_id = ?i", $order_id);
    if ($question) {
        $question = unserialize($question);
    }
    return $question;
}

/**
 * Serialize select_type in params
 *
 * @param  array $params question fields
 *
 * @return array
 */
function fn_sd_checkout_questions_serialize_select_type($params)
{
    $select_type = array_map('trim', array_filter(explode(',', $params['select_type'])));

    if ($params['type'] === 'S' && $select_type) {
        $params['select_type'] = serialize($select_type);
    }

    return $params;
}

/**
 * Get all questions sort by position and filer by status A
 *
 * @return array
 */
function fn_sd_checkout_questions_get_all_for_front()
{
    $questions = db_get_array('SELECT * FROM ?:checkout_questions WHERE status = ?s ORDER BY position', 'A');
    foreach ($questions as $key => $value) {
        if ($value['select_type']) {
            $questions[$key]['select_type'] = unserialize($value['select_type']);
        }
    }
    return $questions;
}

/**
 * Check and clean user data
 *
 * @param  array $data user fields
 *
 * @return array
 */
function fn_sd_checkout_questions_check_user_data($data)
{
    $res = [];
    foreach ($data as $key => $value) {
        if ($value) {
            $res[$key] = trim(strip_tags($value));
        }
    }

    return $res;
}

/****/
/**** HOOKS ****/
/****/

/**
 * Executes before checking a product stock balance when placing an order on checkout,
 * allows to modify product data.
 *
 * @param array  $cart    Cart contents
 * @param array  $auth    Authentication data
 * @param array  $params  Request parameters
 * @param string $cart_id Product cart ID
 * @param string $product Product data
 * @param string $_is_edp Whether product is downloadable
 */
function fn_sd_checkout_questions_checkout_place_order_before_check_amount_in_stock(&$cart, $auth, $params, $cart_id, $product, $_is_edp)
{
    $cart['rq_data'] = $params['rq_data'];
}

/**
 * Places an order
 *
 * @param array  $cart              Array of the cart contents and user information necessary for purchase
 * @param array  $auth              Array of user authentication data (e.g. uid, usergroup_ids, etc.)
 * @param string $action            Current action. Can be empty or "save"
 * @param int    $issuer_id
 * @param int    $parent_order_id
 *
 * @return array
 */
function fn_sd_checkout_questions_place_order($order_id, $action, $order_status, $cart, $auth)
{
    if ($cart['rq_data'] && $order_id) {
        $cart['rq_data'] = fn_sd_checkout_questions_check_user_data($cart['rq_data']);
        $data            = serialize($cart['rq_data']);
        db_query('UPDATE ?:orders SET checkout_questions = ?s WHERE order_id = ?i', $data, $order_id);
    }

}
