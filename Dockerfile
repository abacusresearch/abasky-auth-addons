FROM jboss/keycloak-mysql

COPY changeProxy.xsl /opt/jboss/keycloak/

# required for chown operations
USER root
RUN java -jar /usr/share/java/saxon.jar \
      -s:/opt/jboss/keycloak/standalone/configuration/standalone.xml \
      -xsl:/opt/jboss/keycloak/changeProxy.xsl \
      -o:/opt/jboss/keycloak/standalone/configuration/standalone.xml && \
    java -jar /usr/share/java/saxon.jar \
      -s:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml \
      -xsl:/opt/jboss/keycloak/changeProxy.xsl \
      -o:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml && \
    rm /opt/jboss/keycloak/changeProxy.xsl && \
    chown -R jboss:root /opt/jboss/keycloak/standalone && \
    chmod -R g+rw /opt/jboss/keycloak/standalone && \
    find /opt/jboss/keycloak/standalone -type d -exec chmod g+x "{}" \;
USER jboss
