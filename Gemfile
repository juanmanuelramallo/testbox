source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.0"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "redis", "~> 4.0"

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "web-console"
end

gem "aws-sdk-s3", require: false
gem "devise"
gem "inline_svg"
gem "pagy"
gem "pundit"
gem "sidekiq"
gem "simple_form"
gem "tailwindcss-rails"

group :development do
  gem "annotate"
end

group :development, :test do
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "i18n-tasks"
  gem "letter_opener"
  gem "rspec-rails"
  gem "standard"
  gem "webmock"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "rspec-log_matcher"
  gem "rspec-retry"
  gem "shoulda-matchers"
  gem "simplecov", "~> 0.17.1"
  gem "webdrivers"
end
