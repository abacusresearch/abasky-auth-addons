<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false onlyPanel=true; section>
    <#if section = "header">
        <#if messageHeader??>
            ${messageHeader}
        <#else>
            ${message.summary}
        </#if>
    <#elseif section = "form">
        <i class="alert-icon pe-7s-check m-b-md"></i>

        <p class="alert-instruction-lg">
            ${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b></#list><#else></#if>
        </p>
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri??>
                <p class="alert-instruction-md"><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            <#elseif actionUri??>
                <p class="alert-instruction-md"><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>
            <#elseif client.baseUrl??>
                <p class="alert-instruction-md"><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>

        </#if>
    </#if>
</@layout.registrationLayout>