{if $addons.sd_checkout_questions.checkout_questions_view == 'Y'}

    {$questions = fn_sd_checkout_questions_get_all_for_front()}

    {if is_array($questions) }

        <h3>{__("checkout_questions_header_form")}</h3>

        {foreach from=$questions item=item key=key}
            <div class="ty-control-group">
                	<label for="rq_data_{$key}" class="ty-control-group__title {if $item.required == 'Y'}cm-required{/if}">{$item.title}</label>  
                {if $item.type == 'I'} 
                	<input id="rq_data_{$key}" class="ty-input-text" size="50" type="text" name="rq_data[{$item.title}]" value="">           
                {else if $item.type == 'T'}
                	<textarea id="rq_data_{$key}" class="ty-form-builder__textarea" name="rq_data[{$item.title}]" cols="67" rows="10"></textarea>
                {else if $item.type == 'C'}
                	<input id="rq_data_{$key}" class="ty-form-builder__checkbox checkbox" type="checkbox" name="rq_data[{$item.title}]" value="Y">
                {else if $item.type == 'S' && is_array($item.select_type)}
                	<select id="rq_data_{$key}" class="ty-form-builder__select" name="rq_data[{$item.title}]">
                        <option label="" value="">- Выбрать -</option>
                        {foreach from=$item.select_type item=val}
                        	 <option value="{$val}">{$val}</option>
                        {/foreach}           
                    </select>
                {/if}
            </div>        	
        {/foreach}

    {/if}
    
{/if}