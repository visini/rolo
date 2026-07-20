source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.1.3"
# Use pg as the database for Active Record
gem "pg"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 8.0"
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:windows, :jruby]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 2.0"
gem "ruby-vips", "~> 2.3" # this is needed for image_processing >= 2.0.0

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: [:mri, :windows], require: "debug/prelude"

  # Audits gems for known security defects (use config/bundler-audit.yml to ignore issues)
  gem "bundler-audit", require: false

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Standard Ruby linter and formatter [https://github.com/standardrb/standard]
  gem "standard", ">= 1.35.1", require: false
  gem "standard-rails", require: false

  gem "oaken"

  gem "pg_query"
  gem "prosopite"
end

group :development do
  gem "web-console"
  gem "i18n-tasks"

  gem "database_consistency", require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "capybara-playwright-driver"

  gem "shoulda-matchers"
  gem "shoulda-context"

  gem "minitest-mock"
  gem "webmock"

  gem "simplecov", require: false
end

gem "vite_rails"
gem "inertia_rails"
gem "inertia_i18n"

gem "oj"
gem "alba"
gem "alba-inertia"
gem "typelizer"

gem "pagy"
gem "discard"
gem "paper_trail"

gem "draper"

gem "phonelib"
