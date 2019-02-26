<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false; section>
    <#if section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <a id="kc-back-to-login" class="text-underline" href="${url.loginUrl}">${msg("backToLogin")?no_esc}</a>
        <h4 class="m-t-md m-b-xl">${msg("loginProfileTitle")}</h4>
        <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
                <div class="floating-label-wrap m-b-md">
                    <input type="text" data-value="${(user.username!'')}" id="username" name="username" value="${(user.username!'')}" class="form-control">
                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                </div>
            </#if>
            <div class="floating-label-wrap m-b-md">
                <input type="text" data-value="${(user.email!'')}" id="email" name="email" value="${(user.email!'')}" class="form-control">
                <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
            </div>

            <div class="floating-label-wrap m-b-md">
                <input type="text" data-value="${(user.firstName!'')}" id="firstName" name="firstName" value="${(user.firstName!'')}" class="form-control">
                <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
            </div>

            <div class="floating-label-wrap m-b-md">
                <input type="text" data-value="${(user.lastName!'')}" id="lastName" name="lastName" value="${(user.lastName!'')}" class="form-control">
                <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
            </div>

            <div id="kc-form-button-login" class="${properties.kcFormButtonsClass!}">
                <input class="btn btn-primary pull-right" type="submit" value="${msg("doSubmit")}">
            </div>
        </form>
    </#if>
</@layout.registrationLayout>