# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.5"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.5.3"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.6.7"

# Authentication & Authorization with JWT
gem "devise", "~> 4.9.2"
gem "devise-jwt", "~> 0.11.0"

# Soft Deletion
gem "discard", "~> 1.2.1"

# Validations and phone number formatting.
gem "phony_rails", "~> 0.15.0"

# Fast, simple and easy to use serializer
gem "jsonapi-serializer", "~> 2.2.0"

# Catch unsafe migrations in development
gem "strong_migrations", "~> 1.4.4"

# Use Money-Rails
gem "money-rails", "~> 1.15.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "~> 1.16.0", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors", "~> 2.0.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", "~> 1.8.0", platforms: [:mri, :mingw, :x64_mingw]

  # RSpec testing framework for rails
  gem "rspec-rails", "~> 6.0.3"

  # Provides Rails integration for factory_bot gem
  gem "factory_bot_rails", "~> 6.2.0"

  # This helps you find and manage missing and unused translations
  gem "i18n-tasks", "~> 1.0.12"
end

group :development do
  gem "rubocop", "~> 1.53.1", require: false
  gem "rubocop-performance", "~> 1.18.0", require: false
  gem "rubocop-rails", "~> 2.20.2", require: false
  gem "rubocop-rspec", "~> 2.22.0", require: false
  gem "rubocop-shopify", "~> 2.14.0", require: false
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
