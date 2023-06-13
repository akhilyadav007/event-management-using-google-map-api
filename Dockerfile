FROM ruby:3.0-slim-buster

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /event-management
COPY Gemfile /event-management/Gemfile
COPY Gemfile.lock /event-management/Gemfile.lock
RUN bundle install


EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]