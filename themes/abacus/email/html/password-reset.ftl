<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${msg("passwordResetSubject")}
<#elseif section = "content">
  ${msg("passwordResetBodyHtml",link, linkExpiration, realmName)}
</#if>
</@layout.registrationLayout>
