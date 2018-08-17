FROM tomcat:latest

MAINTAINER mwsong <mwsong@rockplace.co.kr>

RUN rm -rf /usr/local/tomcat/webapps/

ADD webapps /usr/local/tomcat/webapps

WORKDIR /usr/local/tomcat/bin

CMD ["catalina.sh","run"]
