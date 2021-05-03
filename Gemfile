source 'https://rubygems.org'
ruby "2.5.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 6.1.3'
# gem 'activesupport', '6.1.3'
# gem 'actionpack', '6.1.3.1'
# gem 'actionpack', '~> 6.1.3.1'
gem 'activemodel' , '~> 6.1.3'
# gem 'actionpack', '6.1.3'
gem 'activerecord', '>= 6.1.3'
# gem 'actionview', '6.1.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4', group: [:test]
# use pg for local and prod development
gem 'pg', group: [:test, :development, :production]
gem 'webpacker', '~> 5.0'
gem 'react-rails'


# Use SCSS for stylesheets
gem 'sass-rails', '>= 6.0'

gem 'bourbon'
gem 'neat'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Use Redis adapter to run Action Cable in production
 # gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'minitest-rails-capybara', '3.0.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# gem 'rake', '13.0.3'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', group: :doc

gem 'httparty', '~> 0.14.0'
gem 'aasm', '~> 4.12.0'

gem 'rubyXL'
gem 'ruby-progressbar'
# ////// 1 line added below by Jeff Swope // then added ver # dependency
 

group :test do
  # line below commented Jeff Swope
  # gem 'minitest-rails-capybara', '~> 3.0', '>= 3.0.2'
  gem 'bundler', '1.17.3'
  gem 'minitest-spec-rails'
  gem 'webmock'
  gem 'mocha'
  gem 'minitest-reporters', '1.3.0'
  
  # gem 'capybara', '~> 2.7'
  gem 'minitest'
  # gem 'selenium-webdriver'
  # gem 'webdrivers'
  gem 'launchy'
#  gem 'capybara-screenshot'
  gem 'capybara', '>= 3.26'
  # gem 'capybara'
  gem 'simplecov', '~> 0.21.2'
 # Easy installation and use of web drivers to run system tests with browsers
   gem 'webdrivers'
   gem 'minitest-rails', '~> 3.0'
gem 'railties', '>= 6.0.0'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
end

#coverage map for testing
# gem 'simplecov', :require => false, :group => :test

#using puma server instead of webBrick
gem 'puma', '~> 5.1'
#base authentication gem
gem 'devise', git: 'https://github.com/heartcombo/devise', branch: 'ca-omniauth-2'
#setting user permissions for pages
gem 'cancan', '~> 1.6.10'

#js runtime
gem 'execjs', '~> 2.7.0'
#communication with aws S3 & other utils
gem 'aws-sdk', '~> 2.2.37'

# Should use 5.0.13 but compatibility issues with SIT version of RH, has older GCC.    Eventualaly when they upgrade RH, we can move back to the latest
gem 'font-awesome-sass', '5.0.9'
gem 'font-awesome-rails'
gem 'activerecord-session_store'
gem 'whenever', require: false
gem 'oauth2'
gem 'omniauth-oauth2'
gem 'faraday_middleware'

gem 'omniauth-urs', :git => "https://git.earthdata.nasa.gov/scm/cmrarc/omniauth-urs.git", tag: "release/v1.2.0"
gem 'omniauth-rails_csrf_protection'
# gem 'omniauth-urs', :git => "https://git.earthdata.nasa.gov/scm/cmrarc/omniauth-urs.git", path: "/Users/cgokey/src/rails/ruby2.7.2/omniauth-urs"

gem 'figaro'
gem 'rails-controller-testing'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  # gem 'web-console'
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
   gem 'rack-mini-profiler', '~> 2.0'
   gem 'listen', '~> 3.3'

  # Adds support for Capybara system testing and selenium driver

   
   gem 'selenium-webdriver'

   

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rdoc'
  gem 'rubyzip', '1.3.0'
  gem 'rails-erd'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem