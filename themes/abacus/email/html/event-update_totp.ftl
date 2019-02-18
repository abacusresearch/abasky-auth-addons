<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
    ${kcSanitize(msg("eventUpdateTotpSubject"))?no_esc}
<#elseif section = "content">
    ${kcSanitize(msg("eventUpdateTotpBodyHtml",event.date, event.ipAddress))?no_esc}
<#elseif section = "link">
    <#if link??>${link}</#if>
</#if>
</@layout.registrationLayout>