# sonarqube-with-plugins

This image was created to share an already-done configuration of Sonarqube comunity with [dependency-checker plugin](https://github.com/dependency-check/dependency-check-sonar-plugin).

The orginal github repo is [here](https://github.com/SonarSource/docker-sonarqube/). 
The docker image is the [official sonarqube image](https://hub.docker.com/_/sonarqube?tab=description).

The latest version of image is `1.2.1`

## How to build

```shell
docker build -t xcesco/sonarqube-with-plugins:{LATEST_VERSION} .
```

## How to execute
```shell
docker run --name sonarqube-with-plugins-{LATEST_VERSION} -d -p  9000:9000 xcesco/sonarqube-with-plugins:{LATEST_VERSION}
```


## How to pull image
```shell
docker push xcesco/sonarqube-with-plugins:{LATEST_VERSION}
```

## Installed plugins
List of preinstalled plugin:

- [sonar-dependency-check-plugin-2.0.8.jar](https://github.com/dependency-check/dependency-check-sonar-plugin/releases/download/2.0.8/sonar-dependency-check-plugin-2.0.8.jar)
- [sonar-groovy-plugin-1.8.jar](https://github.com/Inform-Software/sonar-groovy/releases/download/1.8/sonar-groovy-plugin-1.8.jar)
- [checkstyle-sonar-plugin-9.0.1.jar](https://github.com/checkstyle/sonar-checkstyle/releases/download/9.0.1/checkstyle-sonar-plugin-9.0.1.jar)
- [sonar-flutter](https://github.com/insideapp-oss/sonar-flutter/releases/download/0.4.0/sonar-flutter-plugin-0.4.0.jar)


## How to perform a scan
From [sonarscanner docs](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/):
Define a `sonar-project.properties` file like this:
```properties
# must be unique in a given SonarQube instance
sonar.projectKey=my:project

# --- optional properties ---

# defaults to project key
#sonar.projectName=My project
# defaults to 'not provided'
#sonar.projectVersion=1.0
 
# Path is relative to the sonar-project.properties file. Defaults to .
#sonar.sources=.
sonar.sources=lib
sonar.tests=test
 
# Encoding of the source code. Default is default system encoding
sonar.sourceEncoding=UTF-8
```
To Execute sonar-scanner in docker container:
```
docker run \
    --rm \
    -e SONAR_HOST_URL="http://${SONARQUBE_URL}" \
    -e SONAR_LOGIN="myAuthenticationToken" \
    -v "${YOUR_REPO}:/usr/src" \
    sonarsource/sonar-scanner-cli
```    

The `${SONARQUBE_URL}` rapresents the sonarqube's URL. Since sonar-scanner run in a container, the specified URL have to work with IP of sonarqube instance running in container. To obtain this information is necessary execute this command: 

```shell
docker inspect sonarqube-with-plugins-{LATEST_VERSION} | grep IPAddress
```
