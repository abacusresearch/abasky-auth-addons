<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false; section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <h4 class="m-t-md m-b-xl">${msg("updatePasswordTitle")}</h4>
        <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

            <div class="floating-label-wrap m-b-md">
                <input type="password" data-value id="password-new" name="password-new" class="form-control" autofocus autocomplete="new-password" required>
                <label for="password-new">${msg("passwordNew")}</label>
            </div>

            <div class="floating-label-wrap m-b-md">
                <input type="password" data-value id="password-confirm" name="password-confirm" class="form-control" autocomplete="new-password" required>
                <label for="password-confirm">${msg("passwordConfirm")}</label>
                <small id="static-pwd-policy-disclaimer" class="m-t-xs">${msg("passwordPolicyMin")}: ${msg("passwordPolicyMinCharacters")} &#8226;
                    ${msg("passwordPolicyMinNumbers")} &#8226; ${msg("passwordPolicyMinLowercase")} &#8226;
                    ${msg("passwordPolicyMinUppercase")}</small>

            </div>

            <div id="kc-form-button-login" class="${properties.kcFormButtonsClass!}">
                <input class="btn btn-primary pull-right" type="submit" value="${msg("doSubmit")}">
            </div>
        </form>
    </#if>
</@layout.registrationLayout>