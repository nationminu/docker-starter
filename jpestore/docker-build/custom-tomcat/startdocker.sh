#!/usr/bin/env bash

cd /usr/local/scouter-agent/agent.host && \
./host.sh  && \
cd /usr/local/tomcat/bin && \
./catalina.sh run
