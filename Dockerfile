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
# Dotfile
# ===============================================================================================================
COPY .bash_profile /root/dotfiles/
COPY .bashrc /root/dotfiles/
COPY .vimrc /root/dotfiles/
COPY .gvimrc /root/dotfiles/

RUN ln -sf /root/dotfiles/.bash_profile /root/.bash_profile && \
    ln -sf /root/dotfiles/.bashrc /root/.bashrc && \
    ln -sf /root/dotfiles/.vimrc /root/.vimrc && \
    ln -sf /root/dotfiles/.gvimrc /root/.gvimrc
