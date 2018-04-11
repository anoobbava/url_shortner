source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
gem 'apipie-rails', '~> 0.5.7'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'
gem 'sqlite3', '~> 1.3', '>= 1.3.13'
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot', '~> 4.8', '>= 4.8.2'
  gem 'faker', '~> 1.8', '>= 1.8.7'
  gem 'rspec-rails', '~> 3.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry'
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'database_cleaner', '~> 1.5'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing', '~> 0.0.3'
  gem 'rspec', '~> 3.6'
  gem 'simplecov'
end
