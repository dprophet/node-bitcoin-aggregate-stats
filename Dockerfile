FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN set -x \
    && yum -y update; yum clean all

#Install some dependencies    
RUN set -x \
    && yum install -y git \
    && yum install -y java \
    && yum install -y ruby-devel \
    && yum install -y rubygem-bundler \
    && yum install -y strace \
    && yum install -y wget \
    && yum install -y autoconf automake bison bzip2 gcc-c++ libffi-devel libtool patch readline-devel sqlite-devel zlib-devel glibc-headers glibc-devel libyaml-devel openssl-devel \
    && yum install -y s3cmd \
    && yum install -y unzip \
    && yum install -y docbook-dtds docbook-style-dsssl docbook-style-xsl libxslt openjade flex

# Install as CartoDB nvm (Node version manager)
RUN set -x \
    && curl -sSL https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash \
    && /bin/bash -l -c "nvm install 0.10.48" \
    && /bin/bash -l -c "nvm install 0.10.26"

CMD     ["/bin/bash", "-i"]
