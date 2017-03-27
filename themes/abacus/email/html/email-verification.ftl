<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${msg("emailVerificationSubject")}
<#elseif section = "content">
  ${msg("emailVerificationBodyHtml",link, linkExpiration, realmName)}
</#if>
</@layout.registrationLayout>

