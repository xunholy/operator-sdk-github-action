ARG RELEASE_VERSION=v0.11.0

FROM ubuntu:latest

LABEL "name"="Operator-SDK Docker Action" \
    "maintainer"="Michael Fornaro <michaelfornaro@gmail.com>" \
    "version"="1.0.0"

ENV RELEASE_VERSION=${RELEASE_VERSION}

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && \
    apt-get install curl && \
    curl -LO https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu && \
    chmod +x operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu

ENTRYPOINT ["/entrypoint.sh"]