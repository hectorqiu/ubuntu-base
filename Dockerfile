# 测试docker镜像，
FROM ubuntu:14.04.3

MAINTAINER Hector Qiu <hectorqiuiscool@gmail.com>


# update apt sources to 163 sources for china mainland user
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
ADD 163_sources.list.trusty /etc/apt/sources.list
# RUN cat /etc/apt/163_sources.list.trusty /etc/apt/sources.list.bak > /etc/apt/sources.list

RUN apt-get update


RUN export DEBIAN_FRONTEND=noninteractive

# set timezone
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Ensure UTF-8 locale
ADD locale /etc/default/locale

RUN apt-get -qy install zhcon

RUN locale-gen en_US.UTF-8 &&\
    locale-gen zh_CN.UTF-8

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  


# EXPOSE 80
# EXPOSE 443
