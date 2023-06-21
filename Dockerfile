FROM ruby:3.0

# Set the working directory in the container
WORKDIR /app

# Copy the gem file to the container
COPY pg_online_schema_change-0.9.7.gem pg_online_schema_change.gem

# Install the gem
RUN gem install pg_online_schema_change.gem --no-document && \
    ln -s /usr/local/bundle/bin/pg-online-schema-change /usr/local/bin/pg-online-schema-change

