ARG RUBY_VERSION=3.3.4
FROM docker.io/library/ruby:$RUBY_VERSION AS base

# Arguments for user configuration
ARG USERNAME=devuser
ARG USER_UID=1000
ARG USER_GID=1000
ARG NODE_VERSION=22

# Install base dependencies and create user
RUN apt-get update -qq && \
    apt-get install -y sudo git curl && \
    curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get install -y nodejs && \
    groupadd --gid ${USER_GID} ${USERNAME} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} && \
    echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} && \
    chmod 0440 /etc/sudoers.d/${USERNAME} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure bundler paths
ENV BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    GEM_HOME=/usr/local/bundle \
    HOME=/home/${USERNAME}

# Set workspace and permissions
RUN mkdir -p /workspace && \
    chown -R ${USER_UID}:${USER_GID} /workspace ${BUNDLE_PATH}
WORKDIR /workspace

# Use bash as shell
RUN chsh -s /bin/bash ${USERNAME}

# Switch to non-root user
USER ${USERNAME}

