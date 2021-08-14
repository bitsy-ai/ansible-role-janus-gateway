FROM debian:buster-20210721-slim
LABEL maintainer="Bitsy AI Labs"

# https://github.com/geerlingguy/docker-ubuntu2004-ansible/blob/master/Dockerfile
# https://www.ansible.com/blog/developing-and-testing-ansible-roles-with-molecule-and-podman-part-1
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        python3-dev \
        python3-setuptools \
        python3-pip \
        python3-yaml \
        sudo \
        bash ca-certificates iproute2 python3-apt systemd systemd-sysv aptitude && \
    apt-get clean && rm -rf /var/lib/apt/lists/*;

ARG ANSIBLE_VERSION="4.3.0"
# Create `ansible` user with sudo permissions and membership in `DEPLOY_GROUP`
ENV ANSIBLE_USER=ansible SUDO_GROUP=sudo DEPLOY_GROUP=deployer
RUN set -xe \
  && groupadd -r ${ANSIBLE_USER} \
  && groupadd -r ${DEPLOY_GROUP} \
  && useradd -m -g ${ANSIBLE_USER} ${ANSIBLE_USER} \
  && usermod -aG ${SUDO_GROUP} ${ANSIBLE_USER} \
  && usermod -aG ${DEPLOY_GROUP} ${ANSIBLE_USER} \
  && sed -i "/^%${SUDO_GROUP}/s/ALL\$/NOPASSWD:ALL/g" /etc/sudoers

RUN pip3 install "ansible==${ANSIBLE_VERSION}"

# Allows for testing init system
COPY tools/initctl_faker .
RUN chmod +x initctl_faker && rm -fr /sbin/initctl && ln -s /initctl_faker /sbin/initctl

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]
CMD ["/lib/systemd/systemd"]