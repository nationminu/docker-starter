# Docker Starter 따라하기
=============

## 1. docker image build
-------------

### Dockerfile 생성
<pre><code>]$ vim custom-tomcat/Dockerfile</code></pre>

### Tomcat Example Dockerfile
<pre>
<code>
FROM tomcat:latest 
MAINTAINER mwsong <mwsong@rockplace.co.kr> 
RUN rm -rf /usr/local/tomcat/webapps/* 
WORKDIR /usr/local/tomcat/bin 
CMD ["catalina.sh","run"]
</code>
</pre>

### Tomcat Example 이미지 빌드
<pre><code>]$ docker build -t tomcat/custom custom-tomcat</code></pre>

### Tomcat Example 이미지 빌드 결과
<pre>
<code>
Sending build context to Docker daemon  2.048kB
Step 1/5 : FROM tomcat:latest
latest: Pulling from library/tomcat
55cbf04beb70: Pull complete 
1607093a898c: Pull complete 
9a8ea045c926: Pull complete 
1290813abd9d: Pull complete 
8a6b982ad6d7: Pull complete 
abb029e68402: Pull complete 
d068d0a738e5: Pull complete 
42ee47bb0c52: Pull complete 
ae9c861aed25: Pull complete 
60bba9d0dc8d: Pull complete 
15222e409530: Pull complete 
2dcc81b69024: Pull complete 
Digest: sha256:bbdb0de8298ab7281ff28331a9e4129562820ac54e243e44c3749f389876f562
Status: Downloaded newer image for tomcat:latest
 ---> 5808f01b11bf
Step 2/5 : MAINTAINER mwsong <mwsong@rockplace.co.kr>
 ---> Running in 68112f2b2c12
Removing intermediate container 68112f2b2c12
 ---> 7a9b1cd0fa5e
Step 3/5 : RUN rm -rf /usr/local/tomcat/webapps/*
 ---> Running in 8fa0ed15754a
Removing intermediate container 8fa0ed15754a
 ---> b1f50353b794
Step 4/5 : WORKDIR /usr/local/tomcat/bin
 ---> Running in d7e68e47d806
Removing intermediate container d7e68e47d806
 ---> 5f330831fbee
Step 5/5 : CMD ["catalina.sh","run"]
 ---> Running in b6460e149e6b
Removing intermediate container b6460e149e6b
 ---> 2c42cfa4aaa6
Successfully built 2c42cfa4aaa6
Successfully tagged tomcat/custom:latest 
</code>
</pre>

## 2. docker image 확인
-------------
### Docker 이미지 확인
<pre><code>]$ docker images [-a]</code></pre>

### Docker 이미지 확인 결과
<pre>
<code>
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
test/tomcat         latest              2c42cfa4aaa6        About a minute ago   463MB
tomcat              latest              5808f01b11bf        2 days ago           463MB
</code>
</pre>

## 3. docker 실행 

### Tomcat forground 실행
<pre><code>]$ docker run test/tomcat</code></pre>

### Tomcat background 실행 : -d optional
<pre><code>]$ docker run -d test/tomcat</code></pre>

### port 설정(8080->8080), 컨테이너 이름 설정(tomcat)
<pre><code>]$ docker run -d -p "8080:8080" --name tomcat tomcat/custom</code></pre>

### 종료 
<pre><code>]$ docker stop tomcat</code></pre>

### 강제 종료 
<pre><code>]$ docker kill tomcat</code></pre>
 
### 이미지 삭제  / 전체 삭제
<pre><code>]$ docker rmi tomcat
]$ docker rmi $(docker images -q)</code></pre>

### 컨테이너 확인   
<pre><code>]$ docker ps [-a]</code></pre> 

### 로그 확인 
<pre><code>]$ docker logs [-f] [container_id]</code></pre>

### 컨테이너 삭제 / 전체 삭제 
<pre><code>]$ docker rm [container_id]
]$ docker rm $(docker ps -a -q)
</code></pre>

## 3. docker 연동 테스트

> docker-build/custom-httpd , docker-build/custom-tomcat 빌드 

<pre><code>
]$ docker build -t tomcat/custom docker-build/custom-tomcat
]$ docker build -t tomcat/httpd docker-build/custom-httpd
</code></pre>

### 2) Tomcat 실행 
<pre><code>
]$ docker run -d --name tomcat tomcat/custom 
</code></pre>

### 3) Apache 실행 -> 연동 테스트 
<pre><code> 
]$ docker run -d -p "80:80" --link tomcat httpd/custom 
</code></pre>

### 4) Apache 실행 -> 연동 테스트 
<pre><code>
]$ curl -v http://127.0.0.1/
</code></pre>
