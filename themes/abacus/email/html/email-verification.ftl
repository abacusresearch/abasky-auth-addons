<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${msg("emailVerificationSubject")}
<#elseif section = "content">
  ${msg("emailVerificationBodyHtml", realmName)}
<#elseif section = "contentAfter">
  ${msg("emailVerificationBodyHtmlAfter", linkExpiration)}
<#elseif section = "link">
  <#if user.attributes.registration_redirect_uri??>${user.attributes.registration_redirect_uri}?redirect_uri=${link?url('UTF-8')}<#else>${link}</#if>
</#if>
</@layout.registrationLayout>

