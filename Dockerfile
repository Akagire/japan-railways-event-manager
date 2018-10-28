FROM ruby:latest

ENV WORKING_DIR /myapp
WORKDIR ${WORKING_DIR}

COPY Gemfile* ./

RUN gem install bundler rails && \
  bundle install -j4 && \
  gem cleanup
