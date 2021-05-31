# frozen_string_literal: true

require 'bundler/setup'
require 'lalamove'
require 'dotenv'
require 'pry'

Dotenv.load('.env.test')

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].sort.each do |f|
  require f
end

SimpleCovConfig.configure
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.before(:each) do
    Lalamove.configuration.production = false
    Lalamove.configuration.secret = ENV['SECRET']
    Lalamove.configuration.token = ENV['TOKEN']
    Lalamove.configuration.country = 'pt_BR'
    Lalamove.configuration.currency = 'BRL'
    Lalamove.configuration.city = 'BR_SAO'
  end

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.include FixturesHelper
  VcrConfig.configure(config)

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
