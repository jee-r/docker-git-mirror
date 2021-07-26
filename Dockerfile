FROM alpine:3.14

LABEL name="git-mirror" \
      maintainer="Jee jee@jeer.fr" \
      description="push local git repo to remote repo" \
      url="https://github.com/jee-r/docker-git-mirror" \
      org.label-schema.vcs-url="https://github.com/jee-r/docker-git-mirror"

COPY entrypoint /usr/local/bin/entrypoint

RUN apk update && \
    apk upgrade && \
    apk add --upgrade --no-cache \
      git \
      bash \
      curl \
      tzdata && \
    chmod +x /usr/local/bin/entrypoint

CMD '/usr/local/bin/entrypoint'
