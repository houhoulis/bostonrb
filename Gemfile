source :rubygems

gem "rails", ">= 3.0.3"
gem "rack"
gem 'sqlite3-ruby', :require => 'sqlite3'
gem "haml"
gem "high_voltage"
gem "hoptoad_notifier"
gem "validation_reflection"
gem "formtastic"
gem "pg"
gem "dynamic_form"

# RSpec needs to be in :development group to expose generators
# and rake tasks without having to type RAILS_ENV=test.
group :development, :test do
  gem "rspec-rails", "~> 2.4.0"
  gem "ruby-debug19"
end

group :test do
  gem "cucumber-rails"
  gem "factory_girl_rails"
  gem "bourne"
  gem "capybara"
  gem "database_cleaner"
  gem "fakeweb"
  gem "sham_rack"
  gem "nokogiri"
  gem "timecop"
  gem "treetop"
  gem "shoulda"
  gem "launchy"
  gem "akephalos", :git => "git://github.com/thoughtbot/akephalos.git"
  gem "thin"
end
