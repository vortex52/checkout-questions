{$questions = fn_sd_checkout_questions_get_order_questions($order_info.order_id)}

{include file="common/subheader.tpl" title=__("checkout_questions")}

<div class="control-group">    
    <div>        
        {if is_array($questions) }
        <table class="table table-middle table--relative table-responsive">
            <thead>
                <tr>
                    <th>{__("questions")}</th>
                    <th>{__("answers")}</th>
                </tr>
            </thead>
            <tbody>                
                {foreach from=$questions item=item key=key}
                <tr>
                    <td>{$key}</td>
                    <td>{$item}</td>
                </tr>
                {/foreach}                
            </tbody>
        </table>
        {/if}
    </div>
</div>
