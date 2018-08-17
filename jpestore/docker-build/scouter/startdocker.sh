#!/usr/bin/env bash

nohup java -Xmx512m -classpath ./scouter-server-boot.jar scouter.boot.Boot ./lib
