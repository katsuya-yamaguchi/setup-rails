FROM ruby:2.6.3

ENV APP_ROOT /replica-youtube-api

WORKDIR $APP_ROOT
RUN apt-get update && \
    apt-get install -y mysql-client \
                       apt-transport-https \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    chmod uog+r /etc/gemrc && \
    bundle config --global build.nokogiri --use-system-libraries && \
    bundle config --global jobs 4 && \
    bundle install && \
    rm -rf ~/.gem

COPY . $APP_ROOT/

EXPOSE 8888
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8888"]
