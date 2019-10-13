ARG RELEASE_VERSION=v0.11.0

FROM docker:stable

LABEL "name"="Operator-SDK Docker Action" \
    "maintainer"="Michael Fornaro <michaelfornaro@gmail.com>" \
    "version"="1.0.0"

ENV RELEASE_VERSION=${RELEASE_VERSION}

COPY entrypoint.sh /entrypoint.sh

RUN apk update -q && \
    apk upgrade -q && \
    apk --no-cache -q add curl git go mercurial

ENTRYPOINT ["/entrypoint.sh"]