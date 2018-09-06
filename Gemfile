source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'annotate'
gem 'opt_struct'
gem 'materialize-sass', '~> 1.0.0.beta'
gem 'jquery-rails'
gem 'phonelib'

gem 'rails', '~> 5.1.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem "capistrano", "~> 3.0", require: false
  gem "capistrano-rbenv", "~> 2.1", require: false
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem "capistrano-rails", require: false
  gem "pry-rails"
end

group :development do

  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
