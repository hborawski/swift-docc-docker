FROM swift:5.5.2

ARG NODE_VERSION=16.13.1
ARG DOCC_RENDER_SHA=63d1104e490ecb0f0d578fd98d638ce02465da75

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