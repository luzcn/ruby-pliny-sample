source "https://rubygems.org"
ruby "2.6.1"

gem "multi_json"
gem "oj"
gem "pg"
gem "pliny", "~> 0.27"
gem "pry"
gem "puma", "~> 4"
gem "rack-ssl"
gem "rack-timeout", "~> 0.4"
gem "rake"
gem "rollbar"
gem "sequel", "~> 4.34"
gem "sequel-paranoid"
gem "sequel_pg", "~> 1.6", require: "sequel"
gem "sinatra", [">= 1.4", "< 3.0"], require: "sinatra/base"
gem "sinatra-contrib", require: ["sinatra/namespace", "sinatra/reloader"]
gem "sinatra-router"
gem "sucker_punch"

# Http client for Ruby https://github.com/excon/excon
gem "excon"

group :development, :test do
  gem "pry-byebug"
  gem "rubocop", "~> 0.52.1", require: false
  gem "rubocop-rspec", require: false
end

group :test do
  gem "committee"
  gem "database_cleaner"
  gem "dotenv"
  gem "rack-test"
  gem "rspec"
  gem "simplecov", require: false
end
