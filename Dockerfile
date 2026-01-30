ARG NODE_VERSION=22
ARG DEBIAN_CODENAME=trixie

# Get, unpack Foundry
FROM docker.io/node:$NODE_VERSION-$DEBIAN_CODENAME

USER node

WORKDIR /foundry/app
RUN --mount=type=bind,source=foundryapp.zip,target=/tmp/foundryapp.zip \
    unzip /tmp/foundryapp.zip

VOLUME /foundry/data
ENV FOUNDRY_VTT_DATA_PATH /foundry/data

EXPOSE 30000

ENTRYPOINT ["node", "/foundry/app/main.js"]
