FROM centos:7

# epel-release must be installed first, before trying to install anything from it
RUN yum -y install epel-release

# install basic apps via yum
RUN yum -y install \
    dnf \
    git \
    openssh-client \
    openssh-server \
    ca-certificates \
    jq

# install circleci cli app
RUN curl -fLSs https://circle.ci/cli | bash

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# update system
RUN yum update -y

# install and enable docker
RUN curl -fsSL https://get.docker.com/ | sh
RUN systemctl enable docker

# install hugo
RUN dnf -y install dnf-plugins-core
RUN dnf -y copr enable daftaupe/hugo
RUN dnf -y install hugo
