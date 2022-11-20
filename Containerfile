FROM alpine:latest
MAINTAINER "hikib <hikib@proton.me>

# --- NEED
RUN apk add --no-cache \
    git \
    vim \
    w3m \
    curl \
    tmux \
    bash-completion \
    tree \
    github-cli \
    wget \
    less \
    man-db

WORKDIR /home/repos/github.com/hikmet-kibar
ENV HOME /home

RUN git clone https://github.com/hikmet-kibar/dot && \
    git clone https://github.com/hikmet-kibar/scripts && \
    chmod 0755 ./dot/bash/setup \
    ./dot/vim/setup \
    ./dot/tmux/setup \
    ./scripts/setup

# --- SETUP
# TODO: add a single, minimal setup file
RUN ./dot/bash/setup && \
    ./dot/vim/setup && \
    ./dot/tmux/setup && \
    ./scripts/setup

# TODO install vim plugins

WORKDIR /home
CMD ["/bin/bash"]

