<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${msg("executeActionsSubject")}
<#elseif section = "content">
  ${msg("executeActionsBodyHtml",link, linkExpiration, realmName)}
</#if>
</@layout.registrationLayout>