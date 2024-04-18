# Timestamped tags can be found at: https://hub.docker.com/r/gitpod/workspace-base/tags
FROM gitpod/workspace-base

RUN sudo apt-get update

RUN cd /workspace/

# installing Java and setting JAVA_HOME 
RUN sudo wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz

RUN sudo tar zxf jdk-21_linux-x64_bin.tar.gz --directory /opt/

RUN echo 'export JAVA_HOME=/opt/jdk-21.0.3/' >> /home/gitpod/.bashrc

RUN echo 'export PATH=/opt/jdk-21.0.3/bin:$PATH' >> /home/gitpod/.bashrc

# installing maven and setting M2_HOME
RUN sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz

RUN sudo tar -xvf apache-maven-3.9.6-bin.tar.gz --directory /opt/

RUN echo 'export M2_HOME=/opt/apache-maven-3.9.6' >> /home/gitpod/.bashrc

RUN echo 'export PATH=$M2_HOME/bin:$PATH' >> /home/gitpod/.bashrc
