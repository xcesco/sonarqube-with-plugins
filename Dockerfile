# versione sonarqube con integrazione 
# - dependency-check-sonar-plugin
# https://github.com/dependency-check
# https://github.com/dependency-check/dependency-check-sonar-plugin
FROM sonarqube:8.9.3-community

LABEL author="Francesco Benincasa"
LABEL version="1.0.1"


RUN wget https://github.com/dependency-check/dependency-check-sonar-plugin/releases/download/2.0.8/sonar-dependency-check-plugin-2.0.8.jar \
  -P /opt/sonarqube/extensions/plugins/

RUN wget https://github.com/Inform-Software/sonar-groovy/releases/download/1.8/sonar-groovy-plugin-1.8.jar \
  -P /opt/sonarqube/extensions/plugins/

RUN wget https://github.com/checkstyle/sonar-checkstyle/releases/download/9.0.1/checkstyle-sonar-plugin-9.0.1.jar \
  -P /opt/sonarqube/extensions/plugins/

RUN wget https://github.com/insideapp-oss/sonar-flutter/releases/download/0.4.0/sonar-flutter-plugin-0.4.0.jar \
  -P /opt/sonarqube/extensions/plugins/

EXPOSE 9000
