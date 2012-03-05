source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'pg'
gem "devise"
gem 'omniauth-facebook'
gem 'fb_graph'
gem 'dalli'                   # Memcached
gem 'haml', '>= 3.0.0'
gem 'haml-rails'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'

gem 'carrierwave'               # Image uploading
gem 'fog'                       # Image uploading to S3
gem 'rmagick'                   # Image processing
gem 'best_in_place'             # inline editing for photo admin
gem 'will_paginate', '~> 3.0'   # Pagination
gem 'sitemap_generator'         # https://github.com/kjvarga/sitemap_generator

gem 'acts-as-taggable-on',  :path => "vendor/gems/acts-as-taggable-on-2.2.2" # '~> 2.2.2'  # handle tags for photos

group :development, :test do
  gem 'mysql2'
  gem "rspec-rails", ">= 2.0.1"
  gem 'linecache19', '0.5.13'         # Debugger, for installation see: http://pastie.org/3293194
  gem 'ruby-debug-base19', '0.11.26'
  gem "ruby-debug19", :require => 'ruby-debug'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end