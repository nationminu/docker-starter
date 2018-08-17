#!/usr/bin/env bash

SCOUTER_AGENT_DIR=/usr/local/scouter-agent/agent.java/

JAVA_OPTS="${JAVA_OPTS} -javaagent:${SCOUTER_AGENT_DIR}/scouter.agent.jar"
JAVA_OPTS="${JAVA_OPTS} -Dscouter.config=${SCOUTER_AGENT_DIR}/conf/scouter.conf"
JAVA_OPTS="${JAVA_OPTS} -Dobj_name=jpetstore"
