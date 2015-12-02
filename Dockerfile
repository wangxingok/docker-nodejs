###############################
# docker 构建 nodejs 官方文档 #
###############################

# 基于 centos:centos6 基础镜像进行构建
FROM    centos:centos6

# run 构建的时候执行的命令
# 安装必要的软件包
RUN     yum install -y epel-release
# 安装nodejs和npm软件包
RUN     yum install -y nodejs npm

# 拷贝宿主机文件到镜像
COPY package.json /src/package.json
# 安装 nodejs 依赖
RUN cd /src; npm install

# 拷贝宿主机文件到镜像
COPY . /src
# 暴露端口
EXPOSE  8080:8080
# 启动镜像后执行的命令， 及理解为 镜像启动后立即运行  node /src/bin/www
CMD ["node", "/src/bin/www"]

# 创建镜像 cd $appdir; docker build -t wyx/centos-nodejs-hello .
# 运行镜像 docker run -d -p 8080:8080 wyx/centos-nodejs-hello