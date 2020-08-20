<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true onlyPanel=false>
    <!doctype html>
    <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}">
            </#list>
        </#if>
        <title>${msg("loginTitle",(realm.displayName!''))}</title>
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" >
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" >
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>
    </head>

    <body class="${client.clientId}">
    <div id="kc-header"></div>
    <div id="kc-container">
        <div id="kc-container-wrapper"
                <#if displayInfo>
                    class="form-panel-container login-container login-container--2column"
                <#else>
                    class="form-panel-container login-container"
                </#if>
        >

            <#if !onlyPanel>
                <div class="row">
                    <div id="kc-logo" class="col-md-4"><img alt="Abacus" src="${url.resourcesPath}/img/logo.svg"></div>
                    <h3 id="kc-one-account" class="text-primary-2 m-b-lg col-md-8">${realm.displayName}</h3>
                </div>
            </#if>
            <div id="kc-content" class="hpanel form-panel">
                <div id="kc-content-wrapper" class="panel-body">

                    <#if displayMessage && message?has_content && !onlyPanel>
                        <div class="alert alert-${message.type} col-md-12">
                            <#if message.type = 'success'><span
                                class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                            <#if message.type = 'warning'><span
                                class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                            <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                            <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                            <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>

                    <div id="aba-content-header" class="col-md-12">
                        <#nested "content-header">
                    </div>

                    <#if displayInfo>
                        <div id="kc-info" class="col-md-5">
                            <div id="kc-info-wrapper">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>

                    <div id="kc-form"
                            <#if displayInfo>
                                class="col-md-7"
                            <#else>
                                class="col-md-12"
                            </#if>
                    >
                        <div id="kc-form-wrapper" <#if onlyPanel>class="text-center"</#if>>
                            <#nested "form">
                        </div>
                    </div>
                </div>
            </div>
            <#if !onlyPanel>
                <div id="kc-footer" class="row">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        &copy; <a href="https://www.abacus.ch/" target="_blank">Abacus Research AG</a>
                    </div>
                    <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                        <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                            <div class="kc-locale pull-right">
                                <div class="kc-locale-wrapper">
                                    <div class="kc-dropdown kc-locale-dropdown">
                                        <a href="#" class="kc-current-locale-link">${locale.current}</a>
                                        <ul>
                                            <#list locale.supported as l>
                                                <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                            </#list>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#if>
                </div>
            </#if>
        </div>
    </div>
    </body>
    </html>
</#macro>