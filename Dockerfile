FROM centos:7

# ===============================================================================================================
# BASE packages
# ===============================================================================================================
RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7 && \
    rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 && \
    yum -y update && \
    yum clean all && \
    yum --enablerepo=extras clean metadata && \
    yum install -y \
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
COPY dotfiles/.bash_profile /root/dotfiles/
COPY dotfiles/.bashrc /root/dotfiles/
COPY dotfiles/.vimrc /root/dotfiles/
COPY dotfiles/.gvimrc /root/dotfiles/

RUN ln -sf /root/dotfiles/.bash_profile /root/.bash_profile && \
    ln -sf /root/dotfiles/.bashrc /root/.bashrc && \
    ln -sf /root/dotfiles/.vimrc /root/.vimrc && \
    ln -sf /root/dotfiles/.gvimrc /root/.gvimrc

CMD [ "/bin/bash" ]
