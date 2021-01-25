FROM ruby:2.5-slim-buster

WORKDIR /home/cuducos/
COPY Gemfile* /home/cuducos/

RUN apt update && \
    apt install -y build-essential libffi-dev && \
    gem install bundler && \
    bundler install && \
    apt purge -y build-essential libffi-dev && \
    apt install -y imagemagick && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

COPY _includes/ _includes/
COPY _layouts/ _layouts/
COPY _media/ _media/
COPY _posts/ _posts/
COPY assets/ assets/
COPY blog/ blog/
COPY crowd-funding/ crowd-funding/
COPY hacktivism/ hacktivism/
COPY _config.yml _config.yml
COPY favicon.ico favicon.ico
COPY feed.xml feed.xml
COPY index.md index.md
COPY keybase.txt keybase.txt
COPY robots.txt robots.txt

ENTRYPOINT ["bundle", "exec", "jekyll"]
