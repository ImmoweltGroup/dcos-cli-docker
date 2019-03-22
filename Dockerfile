FROM centos
LABEL maintainer="Leroy Foerster <Leroy.Foerster@immonet.de>"

# Add entrypoint middleware to handle setting DC/OS server URL
ARG API_VERSION
ADD "${API_VERSION}/entrypoint.sh" /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

# Install dependencies
RUN yum install -y wget && yum clean all

ARG arch=x86-64
ARG dcos_cli_release

# Install CLI
RUN wget https://downloads.dcos.io/binaries/cli/linux/${arch}/${dcos_cli_release}/dcos -O dcos
RUN chmod +x dcos
