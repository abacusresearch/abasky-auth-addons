<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${msg("identityProviderLinkSubject")}
<#elseif section = "content">
  ${msg("identityProviderLinkBodyHtml", identityProviderAlias, realmName, identityProviderContext.username, link, linkExpiration)}
</#if>
</@layout.registrationLayout>