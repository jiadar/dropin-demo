source 'https://rubygems.org'

gem 'rails'
gem 'bcrypt'
gem 'puma'
gem 'bootstrap-sass'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'pg'
gem 'geocoder'
gem 'gmaps4rails'
gem 'underscore-rails'
gem 'kaminari'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'simple_token_authentication'
gem 'pry', :group => :development

group :development, :test do
  gem 'byebug',  '9.0.6', platform: :mri
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :production do

end

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
