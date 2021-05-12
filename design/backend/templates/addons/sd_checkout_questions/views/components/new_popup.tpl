{capture name="add_new_quest"}

<form action="{""|fn_url}" method="post" name="add_new_quest" class="form-horizontal form-edit">

<div class="control-group">
    <label class="control-label cm-required" for="title">{__("name")}:</label>
    <div class="controls">
        <input type="text" name="rq_data[title]" id="title" value="" class="span9" />
    </div>
</div>

 <div class="control-group">
    <label class="control-label cm-required" for="type">{__("appearance_type")}:</label>
    <div class="controls">
    <select id="type" class="cm-combo-select cm-toggle-element" name="rq_data[type]">
        {foreach from=$form_types key="key" item="item"}           
            <option value="{$key}">{$item}</option>
        {/foreach}
    </select>
    </div>
</div>

<div class="control-group select_type hidden">
    <label class="control-label" for="select_type">{__("option_variants")}</label>
    <div class="controls">
        <input type="text" name="rq_data[select_type]" id="select_type" value="" class="span9" />
        <p class="muted description">{__("select_checkout_questions")}</p>
    </div>
</div>

 <div class="control-group">
    <label class="control-label" for="required">{__("required")}:</label>
    <div class="controls">
    <input type="hidden" value="N" name="rq_data[required]"/>
    <input type="checkbox" class="cm-toggle-checkbox" value="Y" name="rq_data[required]" id="required"/>
    </div>
</div>

<div class="control-group">
    <label class="control-label" for="position">{__("position")}:</label>
    <div class="controls">
        <input type="number" name="rq_data[position]" id="position" size="10" class="input-text-short" />
    </div>
</div>

{include file="common/select_status.tpl" input_name="rq_data[status]" id="status" hidden=true}

<div class="buttons-container">
    {include file="buttons/save_cancel.tpl" but_name="dispatch[checkout_questions.add]" cancel_action="close"}
</div>

</form>

{/capture}