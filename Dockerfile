FROM ruby:3.1-slim
WORKDIR /home/cuducos/
COPY Gemfile* /home/cuducos/
RUN apt update && \
    apt install -y build-essential imagemagick libffi-dev && \
    gem install bundler && \
    bundler install && \
    apt purge -y build-essential libffi-dev && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*
COPY . .
ENTRYPOINT ["bundle", "exec", "jekyll"]
