FROM ubuntu:19.10

ARG KUBECTL_VERSION=1.17.1
ARG KUBECTX_VERSION=0.7.1

# Install dependencies and create dirs
RUN apt-get update && apt-get install -y --no-install-recommends \
        bash-completion \
        ca-certificates \
        curl \
        git \
        jq \
        less \
        vim \
    && echo ". /etc/bash_completion" >> ~/.bashrc \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p ~/completions \
    && mkdir -p ~/k8s-prompt

WORKDIR /tmp/install-utils

# Install kubectl 
# License: Apache-2.0
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && kubectl completion bash > ~/completions/kubectl.bash \ 
    && echo "source ~/completions/kubectl.bash" >> ~/.bashrc

# Install kubectx/kubens
# License: Apache-2.0
RUN curl -L https://github.com/ahmetb/kubectx/archive/v$KUBECTX_VERSION.tar.gz | tar xz \
    && cd ./kubectx-$KUBECTX_VERSION \
    && mv kubectx kubens /usr/local/bin/ \
    && chmod +x /usr/local/bin/kubectx \
    && chmod +x /usr/local/bin/kubens \
    && cp completion/kubectx.bash ~/completions/ \
    && cp completion/kubens.bash  ~/completions/ \
    && echo "source ~/completions/kubectx.bash" >> ~/.bashrc \
    && echo "source ~/completions/kubens.bash" >> ~/.bashrc \
    && cd ../ \
    && rm -fr ./kubectx-$KUBECTX_VERSION

WORKDIR /workspace
CMD bash