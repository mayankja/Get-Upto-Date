# Use the official Ruby 3.0.0 image as the base image
FROM ruby:2.7.0

# Set the working directory in the container
WORKDIR /app

ENV RAILS_ENV=development

# Install system dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

#Yarn dependencies
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn
RUN yarn install

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the Rails app code into the container
COPY . .

# Expose port 3000 for the Rails app to run on
EXPOSE 3000

# Start the Rails app
CMD ["rails", "server", "-b", "0.0.0.0"]
