<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${kcSanitize(msg("eventLoginErrorSubject"))?no_esc}
<#elseif section = "content">
  ${kcSanitize(msg("eventLoginErrorBodyHtml",event.date,event.ipAddress))?no_esc}
</#if>
</@layout.registrationLayout>