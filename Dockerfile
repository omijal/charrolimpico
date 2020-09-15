FROM ruby:2.7.1-alpine as builder

RUN bundle config --global frozen 1 && \
    bundle config set without 'test development' && \
    apk add --no-cache --update build-base tzdata yarn openssl mysql-dev git
RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install --jobs=4
ENV RAILS_ENV=production
COPY . /app/
RUN rake assets:precompile && rm -rf node_modules tmp /usr/local/bundle/cache /usr/local/bundle/doc
RUN openssl genrsa 2048 > /app/storage/jwt.pem

#===============================================================================
FROM ruby:2.7.1-alpine
RUN apk add --no-cache --update mysql-dev tzdata openssl
RUN mkdir -p /app/storage
WORKDIR /app
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder /app/ /app/

EXPOSE 3000

ENTRYPOINT ["sh","-e","entrypoint.sh"]
