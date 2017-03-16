<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:keycloak="urn:jboss:domain:keycloak-server:1.1">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="//keycloak:subsystem/keycloak:spi[@name='publicKeyStorage']">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
            <keycloak:spi name="eventsListener">
                <keycloak:provider name="jboss-logging" enabled="true">
                     <keycloak:properties>
                         <keycloak:property name="success-level" value="info"/>
                         <keycloak:property name="error-level" value="warn"/>
                     </keycloak:properties>
                 </keycloak:provider>
            </keycloak:spi>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
