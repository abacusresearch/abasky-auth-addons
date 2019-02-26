<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title"  >
  ${kcSanitize(msg("executeActionsSubject"))?no_esc}
<#elseif section = "content">
  ${kcSanitize(msg("executeActionsBodyHtml", realmName))?no_esc}
<#elseif section = "contentAfter">
  ${kcSanitize(msg("executeActionsBodyHtmlAfter", linkExpiration))?no_esc}
<#elseif section = "link">
  <#if link??>${link}</#if>
</#if>
</@layout.registrationLayout>