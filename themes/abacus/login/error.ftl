<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false onlyPanel=true; section>
    <#if section = "error">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <i class="alert-icon pe-7s-attention"></i>
        <h2 class="alert-title">${msg("errorTitle")}</h2>

        <p class="alert-instruction-lg">
            <#if message?has_content>
                ${message.summary}
            </#if>
        </p>
        <#if client?? && client.baseUrl?has_content>
        <p class="alert-instruction-md">
            <a class="text-underline" id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
        </p>
        </#if>
    </#if>
</@layout.registrationLayout>