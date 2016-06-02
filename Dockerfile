FROM node:latest

MAINTAINER Alexander Martin <alex@suitupalex.com>

ENV HOME /root

RUN apt-get update -qq && \
    apt-get install -qq -y software-properties-common

RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list && \
    wget http://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key && \
    apt-key add - < Release.key && \
    apt-get update -qq && \
    apt-get upgrade -qq && \
    apt-get install -qq -y \
      fish \
      vim \
      git \
      build-essential \
      silversearcher-ag


RUN npm install -g \
      eslint \
      eslint-plugin-react \
      greenkeeper \
      n

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
    cd ~/.vim/bundle && \
    git clone https://github.com/dag/vim-fish && \
    git clone https://github.com/digitaltoad/vim-pug && \
    git clone https://github.com/elzr/vim-json && \
    git clone https://github.com/evanmiller/nginx-vim-syntax && \
    git clone https://github.com/hail2u/vim-css3-syntax && \
    git clone https://github.com/mxw/vim-jsx && \
    git clone https://github.com/plasticboy/vim-markdown && \
    git clone https://github.com/othree/html5.vim && \
    git clone https://github.com/othree/html5-syntax.vim && \
    git clone https://github.com/othree/javascript-libraries-syntax.vim && \
    git clone https://github.com/othree/yajs.vim && \
    git clone https://github.com/pangloss/vim-javascript && \
    git clone https://github.com/scrooloose/syntastic

COPY config/.vimrc /root/
COPY config/.gitconfig /root/
COPY config/.gitignore_global /root/
COPY config/config.fish /root/.config/fish/
