# versione sonarqube con integrazione 
# - dependency-check-sonar-plugin
# https://github.com/dependency-check
# https://github.com/dependency-check/dependency-check-sonar-plugin
FROM sonarqube:8.9.2-community

RUN wget https://github.com/dependency-check/dependency-check-sonar-plugin/releases/download/2.0.8/sonar-dependency-check-plugin-2.0.8.jar \
       -P /opt/sonarqube/extensions/plugins/