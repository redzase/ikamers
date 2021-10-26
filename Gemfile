source("https://rubygems.org")

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem("bcrypt", "~> 3.1.7")
gem("jwt", "~> 2.2.0")
gem("puma", "~> 5.5.1")
gem("rails", '~> 6.1.4')
gem("rubocop")
gem("sqlite3")
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'money-rails'
gem 'faker'

group :development, :test do
  gem("byebug", platforms: [:mri, :mingw, :x64_mingw])
  gem("rspec-rails")
  gem("simple_command")
end

group :development do
  gem("listen", '~> 3.3')
  gem("spring")
  gem("web-console")
end

group :test do
  gem("database_cleaner")
  gem("rspec")
  gem("rspec-mocks")
  gem("shoulda-matchers", "~> 4.4.0")
end

gem("tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby])
