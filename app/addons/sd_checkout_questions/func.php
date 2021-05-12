<?php

use Tygh\Registry;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_sd_checkout_questions_add_question($params)
{
	$params = fn_sd_checkout_questions_serialize_select_type($params);

	db_query('INSERT INTO ?:checkout_questions ?e', $params);
}

 function fn_sd_checkout_questions_update_question($params, $id)
 {
 	$params = fn_sd_checkout_questions_serialize_select_type($params);

	db_query('UPDATE ?:checkout_questions SET ?u WHERE id = ?i', $params, $id);
 }

 function fn_sd_checkout_questions_mass_update_questions($params)
 {
 	foreach ($params as $key => $value) { 		
 		db_query('UPDATE ?:checkout_questions SET position = ?i WHERE id = ?i', $value['position'], $key);
 	} 	
 }


function fn_sd_checkout_questions_get_all()
{
	$questions = db_get_array('SELECT * FROM ?:checkout_questions ORDER BY position');
	return $questions;
}


function fn_sd_checkout_questions_delete_question($id)
{
	db_query('DELETE FROM ?:checkout_questions WHERE id = ?i', $id);
}

function fn_sd_checkout_questions_get_question($id)
{
	$question = db_get_row("SELECT * FROM ?:checkout_questions WHERE id = ?i", $id);
	if($question['select_type']) {
		$question['select_type'] = implode(',', unserialize($question['select_type']));
	}
	return $question;
}

function fn_sd_checkout_questions_serialize_select_type($params)
{
	$select_type = array_map('trim',array_filter(explode(',', $params['select_type'])));	

	if($params['type'] === 'S' && $select_type) {
		$params['select_type'] = serialize($select_type);
	} 

	return $params;
}