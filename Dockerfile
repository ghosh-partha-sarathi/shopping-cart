#FROM maven:3.6-jdk-8-slim
############################################################################
# Timestamped tags can be found at: https://hub.docker.com/r/gitpod/workspace-base/tags
FROM gitpod/workspace-base

RUN sudo apt-get update

RUN sudo wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz

RUN sudo tar zxf jdk-21_linux-x64_bin.tar.gz --directory /opt/

RUN echo 'export JAVA_HOME=/opt/jdk-21.0.2/' >> /home/gitpod/.bashrc

RUN echo 'export PATH=/opt/jdk-21.0.2/bin:$PATH' >> /home/gitpod/.bashrc

############################################################################
WORKDIR /src/app/

# mvn needs a user.home in which to run as non-root
# https://hub.docker.com/_/maven , "Running as non-root"
# hence the mkdir and USER command later on
RUN ["mkdir", "/home/projects"]

RUN groupadd projects && useradd -g projects projects && \
  chown -R projects:projects /src/app && \
  chown -R projects:projects /home/projects

# needed for mvn, see above
USER projects

COPY --chown=projects:projects ./pom.xml .

RUN ["mvn", "clean"]

RUN ["mvn", "de.qaware.maven:go-offline-maven-plugin:resolve-dependencies"]

COPY --chown=projects:projects . .

ENTRYPOINT ["sh"]
