source 'https://rubygems.org'

ruby '2.2.2'

gem 'bundler', '>= 1.8.4'
gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'haml-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'simple_form'
gem 'cancancan'

gem 'rails_12factor'
gem 'puma'

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bitters'
  gem 'breezeblocks'
  gem 'guard'
  gem 'guard-livereload'
end

group :test do
  gem 'email_spec'
  gem 'simplecov'
  gem 'rspec-rails', '3.1'
  gem 'cucumber-rails', require: false
end

group :development, :test do
  gem 'faker'
  gem 'database_cleaner', '1.3.0'
  gem 'shoulda-matchers', require: false
  gem 'did-you-mean', '~> 0.1.1'
  gem 'factory_girl_rails'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

gem 'bourbon', '~>4.2.4'
gem 'neat', '~>1.7.2'

# Bower assets served by rails-assets.org
# They will bundle normally without node!
source 'https://rails-assets.org' do
  gem 'rails-assets-d3'
  gem 'rails-assets-c3'
end
