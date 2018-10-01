#  sudo docker build --rm=tru
### update
RUN apt-get -q update
RUN apt-get -q -y upgrade
RUN apt-get -q -y dist-upgrade
RUN apt-get install -q -y libcurl3


# Java
RUN mkdir /root/src

WORKDIR /root/src
#RUN  apt-get install -y default-jdk
RUN  apt-get install -y openjdk-8-jre
# Add java to path

ENV PATH /root/src/jre1.6.0_45/bin:$PATH



# Install MongoDB.
RUN apt-get install -y upstart
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN  apt-get update
RUN apt-get install -y mongodb-org


# Define mountable directories.
VOLUME ["/data/db"]

# Define working directory.
WORKDIR /data
          
# Expose ports.
#   - 27017: process
#   - 28017: http
#EXPOSE 27017
#EXPOSE 28017 
             
      
## Bindaas
RUN mkdir -p /root/bindaas 
ADD https://github.com/sharmalab/bindaas/releases/download/v3.0.2/bindaas-dist-3.0.2.tar.gz /root/bindaas/bindaas.tar.gz
WORKDIR /root/bindaas
RUN tar -xvf bindaas.tar.gz && rm bindaas.tar.gz
COPY bindaas.config.json /root/bindaas/bin/
EXPOSE 9099
WORKDIR /root/bindaas/bin
    
COPY projects /root/bindaas/bin/projects
COPY scripts/db_index.js /root/bindaas/bin/db_index.js
COPY /run.sh /root/bindaas/bin/run.sh
COPY /loadCamicroscopeTemplate.js /root/bindaas/bin/loadCamicroscopeTemplate.js

COPY /load_admin_info.js /root/bindaas/bin/load_admin_info.js

COPY mongod.conf /etc/mongod.conf
#WORKDIR /root/

CMD ["sh", "run.sh"]

