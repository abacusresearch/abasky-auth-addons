<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${msg("eventUpdatePasswordSubject")}
<#elseif section = "content">
  ${msg("eventUpdatePasswordBodyHtml",event.date, event.ipAddress)}
<#elseif section = "link">
  <#if link??>${link}</#if>
</#if>
</@layout.registrationLayout>
