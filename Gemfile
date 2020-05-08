source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'jsonapi-serializers'
gem 'jwt_sessions'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
# gem 'jbuilder', '~> 2.7'
# gem 'redis', '~> 4.0'
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
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
  gem 'factory_bot_rails'
  gem 'rspec', '~> 3.9.0'
  gem 'rspec-rails', '~> 4.0.0.beta4'
  gem 'simplecov', require: false
end
