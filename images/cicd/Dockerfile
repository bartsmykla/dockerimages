FROM centos:7

# install programs
RUN yum -y install \
    epel-release \
    dnf \
    git \
    openssh-client \
    openssh-server \
    ca-certificates

# update system
RUN yum update -y

# install docker
RUN curl -fsSL https://get.docker.com/ | sh
RUN systemctl enable docker

# install hugo
RUN dnf -y install dnf-plugins-core
RUN dnf -y copr enable daftaupe/hugo
RUN dnf -y install hugo
