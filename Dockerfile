# Copyright 2018 Learnk Arts Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

################## BEGIN INSTALLATION ######################

# pulling the base ubuntu 16.04 after updating the security pataches
FROM learnkarts/tomcat:latest

#FILE AUTHOR
MAINTAINER Ramakrishna Thandra <ramakrishna.thandra@gmail.com>

#COPY THE ARTIFACTS
RUN apt-get update -y && \
    apt-get install -y openssh-client git && \
    git clone https://github.com/learnkarts/notificationapp.git && \
    cd notificationapp && \
    mvn clean install && \
    mv target/notificationapp-0.0.1-SNAPSHOT target/ROOT && \
    mv target/ROOT /opt/tomcat/

#EXPOSING THE PORTS
EXPOSE 8080

EXPOSE 8009

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
