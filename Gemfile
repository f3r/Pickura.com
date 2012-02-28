source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'mysql2'
gem 'pg'
gem "devise"
gem "omniauth-facebook"

gem "haml", ">= 3.0.0"
gem "haml-rails"
gem "jquery-rails"
gem 'twitter-bootstrap-rails'

gem 'carrierwave'                     # Image uploading
gem 'fog'                             # Image uploading to S3
gem 'rmagick'                         # Image processing
#gem 'mini_magick'

gem 'acts-as-taggable-on', '~> 2.2.2' # handle tags for photos
gem 'best_in_place'                   # inline editing for photo admin
gem 'will_paginate', '~> 3.0'         # Pagination

group :development, :test do
  gem "rspec-rails", ">= 2.0.1"
#  gem "thin"                          # To avoid: WARN  Could not determine content-length of response body...
  gem 'linecache19', '0.5.13'         # Debugger, for installation see: http://pastie.org/3293194
  gem 'ruby-debug-base19', '0.11.26'
  gem "ruby-debug19", :require => 'ruby-debug'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end