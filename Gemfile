source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "aws-sdk-s3", require: false
gem "bootsnap", require: false
gem "devise"
gem "importmap-rails"
gem "inline_svg"
gem "jbuilder"
gem "pagy"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "pundit"
gem "rails", "~> 7.0.0"
gem "redis", "~> 4.0"
gem "sidekiq"
gem "simple_form"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development do
  gem "annotate"
  gem "web-console"
end

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
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
