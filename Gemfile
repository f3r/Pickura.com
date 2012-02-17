source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'mysql2'
gem "devise"
gem "omniauth-facebook"
gem "haml", ">= 3.0.0"
gem "haml-rails"
gem "jquery-rails"
gem 'twitter-bootstrap-rails'
gem 'rmagick'
gem 'carrierwave'
gem 'fog'
gem 'pg'
gem 'acts-as-taggable-on', '~> 2.2.2'

group :development, :test do
  gem "rspec-rails", ">= 2.0.1"
  # To avoid: WARN  Could not determine content-length of response body. Set content-length of the response or set Response#chunked = true
  # rails s thin
  gem "thin"
  # Debugger, for installation see: http://pastie.org/3293194
  gem 'linecache19', '0.5.13'
  gem 'ruby-debug-base19', '0.11.26'
  gem "ruby-debug19", :require => 'ruby-debug'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end