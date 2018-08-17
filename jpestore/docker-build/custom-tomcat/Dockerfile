FROM tomcat:latest

MAINTAINER mwsong <mwsong@rockplace.co.kr>

RUN rm -rf /usr/local/tomcat/webapps/*

ADD scouter /usr/local/scouter-agent/

#ADD hostdocker.sh /usr/local/scouter-agent/agent.host/
#RUN /usr/local/scouter-agent/agent.host/host.sh

ADD setenv.sh /usr/local/tomcat/bin/
ADD startdocker.sh /usr/local/tomcat/bin/

RUN chmod 700 /usr/local/tomcat/bin/setenv.sh
RUN chmod 700 /usr/local/tomcat/bin/startdocker.sh

WORKDIR /usr/local/tomcat/bin

#CMD ["catalina.sh","run"]
CMD ["startdocker.sh","run"]
 
