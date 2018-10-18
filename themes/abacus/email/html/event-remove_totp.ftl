<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${msg("eventRemoveTotpSubject")}
<#elseif section = "content">
  ${msg("eventRemoveTotpBodyHtml",event.date,event.ipAddress)}
<#elseif section = "link">
  <#if link??>${link}</#if>
</#if>
</@layout.registrationLayout>