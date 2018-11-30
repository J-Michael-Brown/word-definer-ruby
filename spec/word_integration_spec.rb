require('capybara/rspec')
require('./app')
require('pry')
require('word')
Capybara.app = Sinatra::Application
set(:show_exception, false)
