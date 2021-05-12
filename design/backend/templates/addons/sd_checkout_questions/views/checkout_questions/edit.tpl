{capture name="mainbox"}

{script src="js/addons/sd_checkout_questions/checkout_questions.js"}

{if $question }
<form class="form-horizontal form-edit" action="{""|fn_url}" method="POST" name="checkout_questions_form">
<input type="hidden" name="id" value="{$question.id}">
<div class="control-group">
    <label class="control-label cm-required" for="title">{__("name")}:</label>
    <div class="controls">
        <input type="text" name="rq_data[title]" id="title" value="{$question.title}" class="span9" />
    </div>
</div>

 <div class="control-group">
    <label class="control-label cm-required" for="type">{__("appearance_type")}:</label>
    <div class="controls">
    <select id="type" class="cm-combo-select cm-toggle-element" name="rq_data[type]">
        {foreach from=$form_types key="key" item="item"}           
            <option {if $question.type == $key} selected{/if} value="{$key}">{$item}</option>
        {/foreach}
    </select>
    </div>
</div>

<div class="control-group select_type {if !$question.select_type} hidden{/if}">
    <label class="control-label" for="select_type">{__("option_variants")}</label>
    <div class="controls">
        <input type="text" name="rq_data[select_type]" id="select_type" value="{$question.select_type}" class="span9" />
        <p class="muted description">{__("select_checkout_questions")}</p>
    </div>
</div>

 <div class="control-group">
    <label class="control-label" for="required">{__("required")}:</label>
    <div class="controls">
    <input type="hidden" value="N" name="rq_data[required]"/>
    <input type="checkbox" class="cm-toggle-checkbox" value="Y" name="rq_data[required]" id="required" {if $question.required == "Y"}checked="checked"{/if}/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="position">{__("position")}:</label>
    <div class="controls">
        <input type="number" name="rq_data[position]" id="position" size="10" class="input-text-short"  value="{$question.position}" />
    </div>
</div>

{include file="common/select_status.tpl" input_name="rq_data[status]" id="status" obj=$question.status hidden=true}
    
</form>

{/if}

{/capture}

{if $question}
{capture name="buttons"}
    {include file="buttons/save.tpl" but_name="dispatch[checkout_questions.update]" but_role="action" but_target_form="checkout_questions_form" but_meta="cm-submit btn-primary"}   
{/capture}
{/if}

{include file="common/mainbox.tpl" title=__("edit_checkout_questions") content=$smarty.capture.mainbox buttons=$smarty.capture.buttons}