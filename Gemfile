source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.6'
gem 'bootsnap', '>= 1.4.4', require: false

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'google-cloud-datastore', '~> 2.2' # GCP Datastore
gem 'bcrypt', '~> 3.1.7' # Use Active Model has_secure_password
gem 'rack-attack', '~> 6.5' # Throttle
gem 'figaro', '~> 1.2' # ENV variables
gem 'jwt', '~> 2.2', '>= 2.2.2' # JWT
gem 'pry-rails'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'pry', '~> 0.14.0'
  gem 'rspec-rails', '~> 4.0.2'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.17'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
