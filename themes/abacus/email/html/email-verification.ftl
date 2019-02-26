<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${kcSanitize(msg("emailVerificationSubject"))?no_esc}
<#elseif section = "content">
  ${kcSanitize(msg("emailVerificationBodyHtml", realmName))?no_esc}
<#elseif section = "contentAfter">
  ${kcSanitize(msg("emailVerificationBodyHtmlAfter", linkExpiration))?no_esc}
<#elseif section = "link">
  <#if user.attributes.registration_redirect_uri??>${user.attributes.registration_redirect_uri}?redirect_uri=${link?url('UTF-8')}<#else>${link}</#if>
</#if>
</@layout.registrationLayout>