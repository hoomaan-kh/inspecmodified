FROM ruby:alpine
MAINTAINER Chef Software, Inc. <docker@chef.io>

ARG VERSION=3.9.3
ARG GEM_SOURCE=https://rubygems.org

RUN mkdir -p /share
RUN apk add --update build-base libxml2-dev libffi-dev git openssh-client && \
    gem install --no-document --source ${GEM_SOURCE} --version ${VERSION} inspec && \
    apk del build-base
ENTRYPOINT ["inspec"]
CMD ["help"]
VOLUME ["/share"]
WORKDIR /share
