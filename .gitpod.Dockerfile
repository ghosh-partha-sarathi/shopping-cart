# Timestamped tags can be found at: https://hub.docker.com/r/gitpod/workspace-base/tags
FROM gitpod/workspace-base

RUN sudo apt-get update

RUN sudo wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz

RUN sudo tar zxf jdk-21_linux-x64_bin.tar.gz --directory /opt/

RUN echo 'export JAVA_HOME=/opt/jdk-21.0.2/' >> /home/gitpod/.bashrc

RUN echo 'export PATH=/opt/jdk-21.0.2/bin:$PATH' >> /home/gitpod/.bashrc