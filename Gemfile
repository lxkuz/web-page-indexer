# frozen_string_literal: true
source 'https://rubygems.org'
ruby '2.4.1'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
gem 'active_model_serializers'
gem 'faraday'
gem 'has_scope'
gem 'kaminari'
gem 'nokogiri'
gem 'overcommit'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.0.2'
gem 'rubocop', require: false
gem 'sidekiq'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'webmock'
end

gem 'simplecov', require: false, group: :test

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
