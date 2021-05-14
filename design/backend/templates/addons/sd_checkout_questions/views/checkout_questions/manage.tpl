{capture name="mainbox"}

{script src="js/addons/sd_checkout_questions/checkout_questions.js"}

<form class="form-horizontal form-edit" action="{""|fn_url}" method="POST" name="checkout_questions_form">

    <div class="table-responsive-wrapper longtap-selection">
        <table width="100%" class="table table-middle table--relative table-responsive">
        <thead 
            data-ca-bulkedit-default-object="true"
            data-ca-bulkedit-component="defaultObject">
        <tr>        
            <th width="10%">{__("position")}</th>
            <th width="50%">{__("name")}</th>
            <th width="10%">&nbsp;</th>
            <th width="10%" class="right">{__("status")}</th>
        </tr>
        </thead>
        {if $checkout_questions}
        {foreach from=$checkout_questions item="var" key="key"}
        <tr class="cm-longtap-target">
            <td width="10%">                
                <input type="text" name="rq_data[{$var.id}][position]" size="3" maxlength="10" value="{$var.position}" class="input-micro input-hidden" />
            </td>
            <td width="50%">        
                <a href="{"checkout_questions.edit?id=`$var.id`"|fn_url}">{$var.title}</a>              
            </td>
            <td width="10%" class="nowrap" data-th="{__("tools")}">          
                {capture name="tools_list"}
                    <li>{btn type="list" text=__("edit") href="checkout_questions.edit?id=`$var.id`"}</li>                
                    <li>{btn type="list" text=__("delete") class="cm-confirm" href="checkout_questions.delete?id=`$var.id`" method="POST"}</li>                
                {/capture}
                <div class="hidden-tools">
                    {dropdown content=$smarty.capture.tools_list}
                </div>
            </td>
            <td width="10%" class="nowrap right" data-th="{__("status")}">                        
                {include file="common/select_popup.tpl" id=$var.id status=$var.status hidden=true object_id_name="id" table="checkout_questions" popup_additional_class="dropleft"}
            </td>
        </tr>

        {/foreach}
        {/if}
        </table>
    </div>
</form>

{include file="addons/sd_checkout_questions/views/components/new_popup.tpl"}

{/capture}

{capture name="adv_buttons"}
    {include file="common/popupbox.tpl" id="add_seo_rule" text=__("add_checkout_questions") title=__("add_checkout_questions") content=$smarty.capture.add_new_quest act="general" icon="icon-plus"}
{/capture}

{if $checkout_questions}
{capture name="buttons"}
    {include file="buttons/save.tpl" but_name="dispatch[checkout_questions.m_update]" but_role="action" but_target_form="checkout_questions_form" but_meta="cm-submit btn-primary"}   
{/capture}
{/if}

{include file="common/mainbox.tpl" title=__("checkout_questions") content=$smarty.capture.mainbox adv_buttons=$smarty.capture.adv_buttons buttons=$smarty.capture.buttons}