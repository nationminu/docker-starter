FROM ubuntu:latest

MAINTAINER mwsong <mwsong@rockplace.co.kr>

RUN apt-get update && apt-get install -y --no-install-recommends \
	              openjdk-8-jdk 

RUN ln -svT "/usr/lib/jvm/java-8-openjdk-$(dpkg --print-architecture)" /docker-java-home

ENV JAVA_HOME /docker-java-home

ADD scouter-all-1.9.0.tar.gz /usr/local/

RUN cd /usr/local/ \
    tar -zxvf scouter-all-1.9.0.tar.gz \
    rm -f scouter-all-1.9.0.tar.gz

ADD startdocker.sh /usr/local/scouter/server/

WORKDIR /usr/local/scouter/server/

CMD ["/usr/local/scouter/server/startdocker.sh"]
 
