FROM alpine:3.7
LABEL maintainer "Marc Wickenden <marc@4armed.com>"

RUN apk --update add curl

ENV OAUTH2_PROXY_MAJOR_VERSION 2.2
ENV OAUTH2_PROXY_VERSION 2.2.0.linux-amd64.go1.8.1

RUN curl -sL -o oauth2_proxy.tar.gz \
    "https://github.com/bitly/oauth2_proxy/releases/download/v${OAUTH2_PROXY_MAJOR_VERSION}/oauth2_proxy-${OAUTH2_PROXY_VERSION}.tar.gz" \
    && tar xzvf oauth2_proxy.tar.gz \
    && mv oauth2_proxy-$OAUTH2_PROXY_VERSION/oauth2_proxy /bin/ \
    && chmod +x /bin/oauth2_proxy \
    && rm -r oauth2_proxy*

ENTRYPOINT ["oauth2_proxy"]

