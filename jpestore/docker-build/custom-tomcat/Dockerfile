FROM tomcat:latest

MAINTAINER mwsong <mwsong@rockplace.co.kr>

RUN rm -rf /usr/local/tomcat/webapps/*

ADD scouter /usr/local/scouter-agent/

ADD scouter-docker.sh /usr/local/scouter-agent/agent.host/

RUN chmod 700 /usr/local/scouter-agent/agent.host/scouter-docker.sh

ADD setenv.sh /usr/local/tomcat/bin/

ADD startup-docker.sh /usr/local/tomcat/bin/

RUN chmod 700 /usr/local/tomcat/bin/setenv.sh
RUN chmod 700 /usr/local/tomcat/bin/startup-docker.sh

WORKDIR /usr/local/tomcat/bin

CMD ["startup-docker.sh"]
 
