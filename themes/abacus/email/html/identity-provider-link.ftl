<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
<#if section = "title">
  ${kcSanitize(msg("identityProviderLinkSubject", identityProviderAlias))?no_esc}
<#elseif section = "content">
  ${kcSanitize(msg("identityProviderLinkBodyHtml", realmName, identityProviderAlias, identityProviderContext.username))?no_esc}
<#elseif section = "contentAfter">
  ${kcSanitize(msg("identityProviderLinkBodyHtmlAfter", linkExpiration, identityProviderAlias, identityProviderContext.username))?no_esc}
<#elseif section = "link">
  <#if link??>${link}</#if>
</#if>
</@layout.registrationLayout>