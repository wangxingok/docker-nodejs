# docker-nodejs
第一个 docker 程序，根据 docker 官方例子做的

# Dcokerfile  文件
FROM    centos:centos6

RUN     yum install -y epel-release

RUN     yum install -y nodejs npm

COPY package.json /src/package.json

RUN cd /src; npm install

COPY . /src

EXPOSE  8080:8080

CMD ["node", "/src/bin/www"]

# 创建镜像 
  cd $appdir; --Dockerfile文件所在目录，及应用目录

  docker build -t wyx/centos-nodejs-hello .
  
# 运行镜像 
  docker run -d -p 8080:8080 wyx/centos-nodejs-hello
