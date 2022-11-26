FROM alpine:latest
MAINTAINER "hikib <hikib@proton.me>

# --- NEED
RUN apk add --no-cache \
    bash-completion \
    curl \
    git \
    github-cli \
    less \
    man-db \
    shellcheck \
    tmux \
    tree \
    tzdata \
    vim \
    w3m \
    wget

WORKDIR /home/repos/github.com/hikmet-kibar
ENV HOME /home

RUN git clone https://github.com/hikmet-kibar/dot && \
    git clone https://github.com/hikmet-kibar/scripts && \
    chmod 0756 ./dot/uni/bash/setup \
    ./dot/uni/tmux/setup \
    ./dot/uni/vim/setup \
    ./dot/uni/w3m/setup \
    ./scripts/uni/setup

# --- SETUP
# TODO: add a single, minimal setup file
RUN ./dot/uni/bash/setup && \
    ./dot/uni/vim/setup && \
    ./dot/uni/tmux/setup && \
    ./dot/uni/w3m/setup && \
    ./scripts/uni/setup

ENV TZ=Europe/Copenhagen

WORKDIR /home
CMD ["/bin/bash"]

