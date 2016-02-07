FROM alpine:3.2
MAINTAINER David Zarlengo <david@zarlengo.io>

# TODO: Don't run this server as root.

RUN apk add --update wget ca-certificates unzip \
 && wget -q -O /tmp/nugetd.zip "https://github.com/politician/nugetd/releases/download/v0.2-alpha/nugetd-0.2-alpha-linux-amd64.zip" \
 && apk del wget ca-certificates \
 && mkdir -p /usr/share/nugetd \
 && /usr/bin/unzip /tmp/nugetd.zip -d /usr/share/nugetd

COPY root/ /

CMD ["/usr/local/bin/start-nugetd"]

