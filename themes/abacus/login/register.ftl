<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "content-header">
        <div id="aba-reg-intro" class="clearfix">
            <h4 class="m-t-md m-b-md fa-pull-left">
                <#if client??>
                    <#if client.name??>
                        ${msg('pleaseRegisterForClient', client.name)}
                    <#else>
                        ${msg('pleaseRegisterForClient', client.clientId)}
                    </#if>
                <#else>
                    ${msg('pleaseLogIn')}
                </#if>
            </h4>
            <div id="aba-back-to-login" class="m-b-md fa-pull-right">
                <a class="text-underline" id="kc-back-to-login" class="text-underline"
                   href="${url.loginUrl}">${msg("alredyHaveAccount")}</a>
            </div>
        </div>
    <#elseif section = "form">
        <div id="aba-divider">
            <div>
                <span>${msg("or")}</span>
            </div>
        </div>

        <form id="kc-register-form" class="${properties.kcFormClass!} m-t-xl" action="${url.registrationAction}"
              method="post">
            <input type="text" readonly value="this is not a login form" style="display: none;">
            <input type="password" readonly value="this is not a login form" style="display: none;">
            <#if !realm.registrationEmailAsUsername>
                <div class="floating-label-wrap">
                    <input type="text" id="username" data-value="${(register.formData.username!'')?html}"
                           class="form-control" name="username" value="${(register.formData.username!'')?html}" required
                           autofocus>
                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                </div>
            </#if>
            <div class="floating-label-wrap">
                <input type="text" id="firstName" data-value="${(register.formData.firstName!'')?html}"
                       class="form-control" name="firstName" value="${(register.formData.firstName!'')?html}" required
                       autofocus>
                <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
            </div>

            <div class="floating-label-wrap">
                <input type="text" id="lastName" data-value="${(register.formData.lastName!'')?html}"
                       class="form-control" name="lastName" value="${(register.formData.lastName!'')?html}" required>
                <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
            </div>

            <div class="floating-label-wrap">
                <input type="email" id="email" data-value="${(register.formData.email!'')?html}" class="form-control"
                       name="email" value="${(register.formData.email!'')?html}" required>
                <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
            </div>

            <#if passwordRequired>
                <div class="floating-label-wrap">
                    <input type="password" id="password" data-value class="form-control" name="password" required>
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                </div>

                <div class="floating-label-wrap">
                    <input type="password" id="password-confirm" data-value class="form-control" name="password-confirm"
                           required>
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    <small id="static-pwd-policy-disclaimer" class="m-t-xs">${msg("passwordPolicyMin")}
                        : ${msg("passwordPolicyMinCharacters")} &#8226;
                        ${msg("passwordPolicyMinNumbers")} &#8226; ${msg("passwordPolicyMinLowercase")} &#8226;
                        ${msg("passwordPolicyMinUppercase")}</small>
                </div>
            </#if>

            <div id="kc-form-submit" class="row m-t-md-xl">
                <#if recaptchaRequired??>
                    <div class="col-md-7 col-sm-7 col-xs-12">
                        <div class="g-recaptcha" data-size="normal" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </#if>
                <div id="kc-form-button-login" class="col-md-5 col-sm-5 col-xs-12 m-t-sm">
                    <input class="btn btn-primary pull-right" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    <#elseif section = "info" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="high">
                <#list social.providers as p>
                    <a href="${p.loginUrl}" id="zocial-${p.alias}"
                       class="btn btn-default btn-block text-left ${p.providerId}"> <span
                            class="text-left">${msg('signWith')} ${p.displayName}</span></a>
                </#list>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>