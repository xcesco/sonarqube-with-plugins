# versione sonarqube con integrazione 
# - dependency-check-sonar-plugin
# https://github.com/dependency-check

FROM sonarqube:10.2.1-community

LABEL author="Francesco Benincasa"
LABEL version="1.4.0"

# https://github.com/dependency-check/dependency-check-sonar-plugin
ARG OWASP_DEPENDENCY_CHECK_VERSION=4.0.0
# https://github.com/Inform-Software/sonar-groovy
ARG GROOVY_PLUGIN_VERSION=1.8
# https://github.com/checkstyle/sonar-checkstyle
ARG CHECKSTYLE_PLUGIN=10.12.3
# https://github.com/insideapp-oss/sonar-flutter
ARG FLUTTER_PLUGIN=0.5.0


RUN wget https://github.com/dependency-check/dependency-check-sonar-plugin/releases/download/${OWASP_DEPENDENCY_CHECK_VERSION}/sonar-dependency-check-plugin-${OWASP_DEPENDENCY_CHECK_VERSION}.jar \
  -P /opt/sonarqube/extensions/plugins/

RUN wget https://github.com/Inform-Software/sonar-groovy/releases/download/${GROOVY_PLUGIN_VERSION}/sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar \
  -P /opt/sonarqube/extensions/plugins/

RUN wget https://github.com/checkstyle/sonar-checkstyle/releases/download/${CHECKSTYLE_PLUGIN}/checkstyle-sonar-plugin-${CHECKSTYLE_PLUGIN}.jar \
  -P /opt/sonarqube/extensions/plugins/

RUN wget https://github.com/insideapp-oss/sonar-flutter/releases/download/${FLUTTER_PLUGIN}/sonar-flutter-plugin-${FLUTTER_PLUGIN}.jar \
  -P /opt/sonarqube/extensions/plugins/

EXPOSE 9000

