source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.7'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

#
gem 'responders', '~> 2.4'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors' # Gema para el intercambio de recursos cruzados

# Use Faker gem to fill the database
gem 'faker', '~> 1.9', '>= 1.9.1'
# Use Will-Paginate
gem 'will_paginate', '~> 3.1.0'

# Use Annotate
gem 'annotate'

# Use serializers
gem 'active_model_serializers' # Gema que permite dar formato JSON a los parámetros y datos que deseamos 

# Autenticación basada en token
gem 'bcrypt', '~> 3.1.7' # Gema que permite almacenar un hash seguro d elas contraseñas de usuarios
gem 'knock' # Gema para la autenticación basada en token en Rails
gem 'jwt' # Gema para usar JSON Web Token

# Use Faker to poblate DB
gem 'faker', '~> 1.9', '>= 1.9.1'

# Use Carriwewave to upload files
gem 'carrierwave', '~> 1.0'

# Use WickedPDF to generate PDF
gem 'wicked_pdf'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  # Use SQLite3
  gem 'sqlite3'

  # Use wkhtmltopdf to local
  #gem 'wkhtmltopdf-binary'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'

  # Use wkhtmltopdf for Heroku
  gem 'wkhtmltopdf-heroku'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
