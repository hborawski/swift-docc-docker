FROM swift:5.5.2
SHELL ["/bin/bash", "-c"]

ARG NODE_VERSION=16.13.1
ARG DOCC_RENDER_SHA=63d1104e490ecb0f0d578fd98d638ce02465da75
ARG RUBY_VERSION=2.7
ARG COCOAPODS_VERSION=1.11.2
ARG AUTO_VERSION=10.32.5

# Install NodeJS

RUN apt update
RUN apt install curl

RUN curl https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz -o node.tar.xz
RUN tar xvf node.tar.xz && rm node.tar.xz

ENV PATH=$PATH:/node-v$NODE_VERSION-linux-x64/bin

# Install swift-docc-render
RUN git clone https://github.com/apple/swift-docc-render.git
RUN cd swift-docc-render && git checkout $DOCC_RENDER_SHA && npm install && npm run build
ENV DOCC_HTML_DIR=/swift-docc-render/dist

# Install RVM
# https://rvm.io/rvm/security
RUN apt install -y gnupg2
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import
RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN source /usr/local/rvm/scripts/rvm && rvm install $RUBY_VERSION && rvm --default use $RUBY_VERSION && rvm @global do gem install cocoapods -v $COCOAPODS_VERSION
RUN echo "source /usr/local/rvm/scripts/rvm" >> ~/.bashrc

RUN curl -vkL -o - https://github.com/intuit/auto/releases/download/v$AUTO_VERSION/auto-linux.gz | gunzip > ~/auto
RUN chmod a+x ~/auto
ENV PATH=$PATH:~/