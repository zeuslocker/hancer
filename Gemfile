source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'trailblazer'
gem 'trailblazer-rails'
gem 'trailblazer-cells'
gem 'cells-haml'
gem 'cells-rails'
gem 'simple_form'
gem 'pg'
gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'toastr-rails'
gem 'sprockets', '>=3.0.0.beta'
gem 'sprockets-es6'
gem "i18n-js"
source "https://rails-assets.org" do
  gem "rails-assets-sweetalert", "~> 1.1.3"
end
gem 'sweet-alert', :git => 'https://github.com/frank184/sweet-alert-rails.git'
gem 'sweet-alert-confirm', :git => 'https://github.com/humancopy/sweet-alert-rails-confirm.git'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
gem 'puma', '~> 3.0'
gem 'unicorn'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'dotenv-rails'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'

  gem 'capistrano', '~> 3.7', '>= 3.7.1'
  gem 'capistrano-bundler', '~> 1.2', require: false
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-slackify', require: false
  gem 'capistrano-rvm'
  gem 'capistrano3-unicorn', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
