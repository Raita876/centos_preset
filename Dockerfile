FROM centos:7

# ===============================================================================================================
# system update
# ===============================================================================================================
RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7
RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7

RUN yum -y update && yum clean all

# ===============================================================================================================
# BASE packages
# ===============================================================================================================
RUN yum --enablerepo=extras clean metadata
RUN yum install -y \
    zlib \ 
    zlib-devel \
    make \
    gcc \
    gcc-c++ \
    openssl \
    openssl-devel \
    readline-devel \
    pcre pcre-devel \
    openssh \
    openssh-server \
    net-tools \
    wget \
    sudo \
    tar \
    zip \
    unzip \
    bzip2 \
    which \
    tree \
    git \
    mercurial \
    vim-enhanced

# ===============================================================================================================
# Vimrc
# ===============================================================================================================
COPY .vimrc /root
COPY .gvimrc /root
RUN echo "alias vi='vim'" >> /root/.bashrc

# ===============================================================================================================
# python setting
# ===============================================================================================================

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y python36u python36u-devel python36u-libs
RUN ln -s /usr/bin/python3.6 /usr/bin/python3

# pip
RUN yum install -y python36u-pip
RUN ln -s /usr/bin/pip3.6 /usr/bin/pip3

RUN pip3 install virtualenv
RUN pip3 install setuptools
RUN pip3 install django
RUN pip3 install pipenv

RUN export LC_ALL=en_US.UTF-8

