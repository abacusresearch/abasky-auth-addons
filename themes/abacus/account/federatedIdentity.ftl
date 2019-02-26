<#import "template.ftl" as layout>
<@layout.mainLayout active='social' bodyClass='social'; section>

    <#if section = "header">
        <h2>${msg("federatedIdentitiesHtmlTitle")}</h2>
    <#elseif section = "content">

    <div id="federated-identities">
        <#list federatedIdentity.identities as identity>
            <div class="row m-b-md">
                <div class="col-sm-2 col-md-2 text-right m-t-xs">
                    <label for="${identity.providerId!}" class="control-label font-normal">${identity.displayName!}</label>
                </div>
                <div class="col-sm-10 col-md-10">
                    <div class="input-btn-absolute">
                        <input disabled class="form-control" value="${identity.userName!}">
                        <#if identity.connected>
                            <#if federatedIdentity.removeLinkPossible>
                                <form action="${url.socialUrl}" method="post" class="form-inline">
                                    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                                    <input type="hidden" id="action" name="action" value="remove">
                                    <input type="hidden" id="providerId" name="providerId" value="${identity.providerId!}">
                                    <button id="remove-link-${identity.providerId!}" class="btn btn-danger btn-block-sm">${msg("doRemove")}</button>
                                </form>
                            </#if>
                        <#else>
                            <form action="${url.socialUrl}" method="post" class="form-inline">
                                <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                                <input type="hidden" id="action" name="action" value="add">
                                <input type="hidden" id="providerId" name="providerId" value="${identity.providerId!}">
                                <button id="add-link-${identity.providerId!}" class="btn btn-primary btn-block-sm">${msg("doAdd")}</button>
                            </form>
                        </#if>
                    </div>
                </div>
            </div>
        </#list>
    </div>
    </#if>

</@layout.mainLayout>