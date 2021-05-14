{if $questions}
<h5>{__("checkout_questions")}</h5>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
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