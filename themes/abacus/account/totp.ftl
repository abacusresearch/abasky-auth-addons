<#import "template.ftl" as layout>
<@layout.mainLayout active='totp' bodyClass='totp' panel=false; section>

    <#if section = "header">
        <h2>${msg("authenticatorTitle")}</h2>
    <#elseif section = "content">

        <#if totp.enabled>
            <div class="table-responsive">
                <table class="table table-panel table-bordered table-striped">
                    <thead>
                    <tr>
                        <th colspan="2">${msg("configureAuthenticators")}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="provider">${msg("mobile")}</td>
                        <td class="action width-40"><a id="remove-mobile" href="${url.totpRemoveUrl}" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
                        <form action="${url.totpUrl}" method="post" class="form-inline">
                            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                            <input type="hidden" id="submitAction" name="submitAction" value="Delete">
                            <button id="remove-mobile" class="btn btn-default"><i class="pficon pficon-delete"></i></button>
                        </form>

                    </tr>
                    </tbody>
                </table>
            </div>
        <#else>


            <div class="hpanel">
                <div class="panel-body panel-body--padding-reset">
                    <h3 class="panel-body__title">1 ${msg("totpStep1Title")}</h3>
                    <div class="panel-body__content">
                        <p>${msg("totpStep1")}</p>
                        <ul>
                            <#list totp.policy.supportedApplications as app>
                                <li>${app}</li>
                            </#list>
                        </ul>
                    </div>

                    <h3 class="panel-body__title">2 ${msg("totpStep2Title")}</h3>
                    <#if mode?? && mode = "manual">
                        <div class="panel-body__content">
                            <p>${msg("totpManualStep2")}</p>
                            <p><span  class="code" id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                            <p><a href="${totp.qrUrl}" id="mode-barcode">${msg("totpScanBarcode")}</a></p>
                        </div>
                        <div class="panel-body__content">
                            <p>${msg("totpManualStep3")}</p>
                            <ul>
                                <li id="kc-totp-type">${msg("totpType")}: ${msg("totp." + totp.policy.type)}</li>
                                <li id="kc-totp-algorithm">${msg("totpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                                <li id="kc-totp-digits">${msg("totpDigits")}: ${totp.policy.digits}</li>
                                <#if totp.policy.type = "totp">
                                    <li id="kc-totp-period">${msg("totpInterval")}: ${totp.policy.period}</li>
                                <#elseif totp.policy.type = "hotp">
                                    <li id="kc-totp-counter">${msg("totpCounter")}: ${totp.policy.initialCounter}</li>
                                </#if>
                            </ul>
                        </div>
                    <#else>
                        <div class="panel-body__content">
                            <p>${msg("totpStep2")}</p>
                            <p><img class="img-thumbnail" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"></p>
                            <p><a href="${totp.manualUrl}" id="mode-manual">${msg("totpUnableToScan")}</a></p>
                        </div>
                    </#if>

                    <h3 class="panel-body__title">3 ${msg("totpStep3Title")}</h3>
                    <div class="panel-body__content">
                        <p>${msg("totpStep3")}</p>

                        <form action="${url.totpUrl}" class="form-horizontal" method="post">
                            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                            <div class="form-group">
                                <div class="col-sm-2 col-md-2">
                                    <label for="totp" class="control-label">${msg("authenticatorCode")}</label>
                                </div>
                                <div class="col-sm-10 col-md-10">
                                    <input type="text" class="form-control" id="totp" name="totp" autofocus autocomplete="off">
                                    <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                                </div>
                            </div>

                            <div class="form-group text-right">
                                <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                                    <button type="submit" class="btn btn-primary pull-right m-l-sm" name="submitAction" value="Save">${msg("doSave")}</button>
                                    <button type="submit" class="btn btn-default" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </#if>
    </#if>
</@layout.mainLayout>