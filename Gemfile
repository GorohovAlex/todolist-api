source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'acts_as_list', '~> 1.0', '>= 1.0.1'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'carrierwave', '~> 2.0'
gem 'dry-monads', '~> 1.3', '>= 1.3.5'
gem 'dry-validation'
gem 'jsonapi-serializers'
gem 'jwt_sessions'
gem 'multi_json'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'pundit'
gem 'rack-cors'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'reform'
gem 'reform-rails', '~> 0.2.0.rc2'
gem 'rswag-ui'
gem 'trailblazer', '~> 2.1.0.rc1'
gem 'trailblazer-rails', '~> 2.1', '>= 2.1.7'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'fasterer', '~> 0.8.0'
  gem 'ffaker'
  gem 'rswag'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.76.0', require: false
  gem 'rubocop-performance', '~> 1.5', '>= 1.5.2', require: false
  gem 'rubocop-rails', '~> 2.4', '>= 2.4.2', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'json_matchers'
  gem 'rspec-rails', '~> 4.0.0.beta4'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
