<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${kcSanitize(msg("passwordResetSubject"))?no_esc}
<#elseif section = "content">
  ${kcSanitize(msg("passwordResetBodyHtml", realmName))?no_esc}
<#elseif section = "contentAfter">
  ${kcSanitize(msg("passwordResetBodyHtmlAfter", linkExpiration))?no_esc}
<#elseif section = "link">
  <#if link??>${link}</#if>
</#if>
</@layout.registrationLayout>