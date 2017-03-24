<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title><#nested "title"></title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
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

<body class="${properties.kcBodyClass!}">

    <div id="kc-container" class="${properties.kcContainerClass!}">
        <#if displayInfo>
        <div id="kc-container-wrapper" class="form-panel-container login-container login-container--2column">
        <#else>
        <div id="kc-container-wrapper" class="form-panel-container login-container">
        </#if>
            
            <div class="row">
                <div id="kc-logo" class="col-md-4"><img src="${url.resourcesPath}/img/logo.svg"></div>
                <h3 id="kc-one-account" class="text-primary-2 m-b-lg col-md-8">${msg("oneAccount")}</h3>
            </div>
            <div id="kc-content" class="hpanel form-panel">
                <div id="kc-content-wrapper" class="panel-body">

                    <#if displayMessage && message?has_content>
                        <div class="alert alert-${message.type} col-md-12">
                            <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                            <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                            <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                            <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                            <span class="kc-feedback-text">${message.summary}</span>
                        </div>
                    </#if>

                    <#if displayInfo>
                    <div id="kc-form" class="col-md-8">
                    <#else>
                    <div id="kc-form" class="col-md-12">
                    </#if>
                        <div id="kc-form-wrapper"> 
                            <#nested "form">
                        </div>
                    </div>

                    <#if displayInfo>
                        <div id="kc-info" class="col-md-4">
                            <div id="kc-info-wrapper">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>
            </div>

            <div id="kc-footer" class="row">
            <#if realm.internationalizationEnabled>
                <div class="col-md-6 col-sm-6 col-xs-6">
                &copy; <a href="http://www.abacus.ch/" target="_blank">ABACUS Research AG</a>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                <div id="kc-locale" class="pull-right">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div class="kc-dropdown" id="kc-locale-dropdown">
                            <a href="#" id="kc-current-locale-link">${locale.current}</a>
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
        </div>
    </div>
</body>
</html>
</#macro>