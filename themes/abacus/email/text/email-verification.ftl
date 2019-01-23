<#if user.attributes.registration_redirect_uri??
  ><#assign specialLink = "${user.attributes.registration_redirect_uri}?redirect_uri=${link?url('UTF-8')}"
  >${msg("emailVerificationBody", specialLink, linkExpiration, realmName)
}<#else
  >${msg("emailVerificationBody", link, linkExpiration, realmName)
}</#if>