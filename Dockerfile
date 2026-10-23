FROM            docker.io/redhat/ubi10
RUN               curl -L -o /etc/yum.repos.d/hashi.repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && curl -o /etc/yum.repos.d/docker.repo https://download.docker.com/linux/rhel/docker-ce.repo && dnf install https://packages.microsoft.com/config/rhel/10/packages-microsoft-prod.rpm -y
RUN               dnf install libicu make terraform docker-ce-cli unzip openssl azure-cli -y


RUN             useradd runner
USER            runner
WORKDIR         /home/runner
RUN              curl -o actions-runner-linux-x64-2.337.0.tar.gz -L \
                https://github.com/actions/runner/releases/download/v2.337.0/actions-runner-linux-x64-2.337.0.tar.gz  \
                && tar xzf ./actions-runner-linux-x64-2.337.0.tar.gz && rm -f ./actions-runner-linux-x64-2.337.0.tar.gz

copy             entrypoint.sh entrypoint.sh
ENTRYPOINT      ["bash", "entrypoint.sh"]