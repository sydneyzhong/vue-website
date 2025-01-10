# 使用本地 Nginx 镜像提供静态文件服务
FROM nginx:latest

# 将所有 HTML 文件和相关资源复制到 Nginx 的静态文件目录
COPY ./shouye/ /usr/share/nginx/html/shouye/
COPY ./gongsijieshao/ /usr/share/nginx/html/gongsijieshao/
COPY ./hangyexinxi/ /usr/share/nginx/html/hangyexinxi/
COPY ./xiangguanjishu/ /usr/share/nginx/html/xiangguanjishu/
COPY ./shouyuechanpin/ /usr/share/nginx/html/shouyuechanpin/
COPY ./zhichi/ /usr/share/nginx/html/zhichi/
COPY ./shouyuechanpinzhankai/ /usr/share/nginx/html/shouyuechanpinzhankai/

# 替换默认 Nginx 配置
COPY ./nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

# 暴露 Nginx 服务端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]

