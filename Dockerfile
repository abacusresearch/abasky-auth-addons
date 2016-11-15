FROM jboss/keycloak-mysql

COPY changeProxy.xsl /opt/jboss/keycloak/

RUN java -jar /usr/share/java/saxon.jar \
      -s:/opt/jboss/keycloak/standalone/configuration/standalone.xml \
      -xsl:/opt/jboss/keycloak/changeProxy.xsl \
      -o:/opt/jboss/keycloak/standalone/configuration/standalone.xml && \
    java -jar /usr/share/java/saxon.jar \
      -s:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml \
      -xsl:/opt/jboss/keycloak/changeProxy.xsl \
      -o:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml && \
    rm /opt/jboss/keycloak/changeProxy.xsl

VOLUME /opt/jboss/keycloak/standalone/data /opt/jboss/keycloak/standalone/log
