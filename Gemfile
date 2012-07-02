require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'
gem 'rails', '3.2.6'
group :assets do
  gem 'uglifier', '>= 1.0.3'
  gem 'haml_coffee_assets'
  gem 'execjs'
end
gem 'coffee-rails', '~> 3.2.1'
gem 'sass-rails',   '~> 3.2.3'
gem "sprockets"
gem 'jquery-rails'
gem "haml", ">= 3.1.4"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "rspec-rails", ">= 2.9.0.rc2", :group => [:development, :test]
gem "machinist", :group => :test
gem "factory_girl_rails", ">= 3.2.0", :group => [:development, :test]
gem "email_spec", ">= 1.2.1", :group => :test
gem "cucumber-rails", ">= 1.3.0", :group => :test
gem "capybara", ">= 1.1.2", :group => :test
gem "database_cleaner", ">= 0.7.2", :group => :test
gem "launchy", ">= 2.1.0", :group => :test
gem "guard", ">= 0.6.2", :group => :development  
# case HOST_OS
#   when /darwin/i
#     gem 'rb-fsevent', :group => :development
#     gem 'growl', :group => :development
#   when /linux/i
#     gem 'libnotify', :group => :development
#     gem 'rb-inotify', :group => :development
#   when /mswin|windows/i
#     gem 'rb-fchange', :group => :development
#     gem 'win32console', :group => :development
#     gem 'rb-notifu', :group => :development
# end
gem "guard-bundler", ">= 0.1.3", :group => :development
gem "guard-rails", ">= 0.0.3", :group => :development
gem "guard-livereload", ">= 0.3.0", :group => :development
gem "guard-rspec", ">= 0.4.3", :group => :development
gem "guard-cucumber", ">= 0.6.1", :group => :development
gem "devise", ">= 2.1.0.rc"
gem "devise_invitable", ">= 1.0.1"
gem "omniauth-facebook"
gem "omniauth-twitter"
gem "twitter-bootstrap-rails", ">= 2.0.3"
gem "therubyracer", :group => :assets, :platform => :ruby
gem "simple_form"
gem "will_paginate", ">= 3.0.3"
gem "pg", "~> 0.13.2"
gem "activeadmin", :git => "git://github.com/gregbell/active_admin.git"
gem "formtastic"#, "~> 2.1.1"
gem "cancan"
gem 'acts_as_tenant'
#gem "thin"
gem 'backbone-on-rails'
gem 'quiet_assets', :group => :development
gem "faker"
gem "rabl"
#gem 'activerecord-postgres-hstore'
gem "carrierwave"
gem "mini_magick"
gem "fog", "~> 1.3.1"
gem "memcache-client"
gem "simplecov", :require => false, :group => :test
gem 'paper_trail'
gem 'best_in_place'
gem 'newrelic_rpm'
gem "active_model_serializers"
gem "jquery-fileupload-rails", :git => "git://github.com/sabril/jquery-fileupload-rails.git"
gem 'aa_associations', :git => "git://github.com/vigetlabs/active_admin_associations.git"