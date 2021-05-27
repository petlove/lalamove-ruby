# frozen_string_literal: true

source 'https://rubygems.org'

gem 'active_service', github: 'petlove/active_service'
gem 'dry-struct', '~> 1.4.0'
gem 'dry-types', '~> 1.5.1'

group :test do
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'rubocop'
  gem 'rubocop-performance'
end

group :development, :test do
  gem 'dotenv'
end

gemspec
