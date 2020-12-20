FROM alpine:3.12

LABEL name="git-mirror" \
      maintainer="Jee jee@jeer.fr" \
      description="push local git repo to remote repo" \
      url="https://git.c0de.in/jee/git-mirror" \
      org.label-schema.vcs-url="https://git.c0de.in/jee/git-mirror"

RUN sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.ircam.fr\/pub/' /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add --upgrade --no-cache \
      git \
      bash \
      curl \
      tzdata

COPY run.sh /usr/local/bin/run.sh

CMD ['/usr/local/bin/run.sh']
