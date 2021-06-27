source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'carrierwave', '~> 2.0'
gem "recaptcha"
gem 'toastr-rails'
gem "figaro"
gem 'bootsnap', '>= 1.4.2', require: false
gem "devise"
gem "omniauth", "~> 1.9.1"
gem "omniauth-google-oauth2"
gem "omniauth-facebook"
gem "cocoon"
gem "ckeditor"
gem "kaminari"
gem "ransack", "~> 2.4", ">= 2.4.2"
gem "paranoia", "~> 2.2"
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
end

group :development do
  gem 'rubocop', '~> 1.7', require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
