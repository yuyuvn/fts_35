source "https://rubygems.org"


# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "4.2.1"
# Use sqlite3 as the database for Active Record
# gem "sqlite3"
# Use mysql2 as the database for Active Resord
# gem "mysql2"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.1.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"
gem "jquery-turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.0"
# bundle exec rake doc:rails generates the API under doc/api.
gem "sdoc", "~> 0.4.0", group: :doc

# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Unicorn as the app server
# gem "unicorn"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

# Timezone for windows environment
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw]

# Use bootstrap as the UI library
gem "bootstrap-sass"

# Paginator
gem "kaminari"

# Rails config
gem "rails_config"

# Use for login/logout, authentication
gem "devise"

# Authorization
gem "cancancan"

# Background job
gem "sidekiq"

gem "whenever", require: false

# Create data
gem "ffaker"
gem "factory_girl_rails"

#Use for search/filter
gem "ransack"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug"

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem "web-console", "~> 2.0"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end
group :production do
  gem "pg"
  gem "capistrano", "~> 3.1.0"
  gem "capistrano-bundler", "~> 1.1.2"
  gem "capistrano-rails", "~> 1.1.1"
  gem "capistrano-rbenv"
  gem "capistrano-sidekiq"
end




