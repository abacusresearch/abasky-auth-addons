<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${msg("eventUpdateTotpSubject")}
<#elseif section = "content">
    ${msg("eventUpdateTotpBodyHtml",event.date, event.ipAddress)}
<#elseif section = "link">
    <#if link??>${link}</#if>
</#if>
</@layout.registrationLayout>