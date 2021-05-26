# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'
require 'support/configs/simple_cov_config'

SimpleCovConfig.configure

# require 'lalamove/ruby'
require 'lalamove'
require 'pry'

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].sort.each do |f|
  require f
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.before(:each) do
    Lalamove.configuration.production = false
    Lalamove.configuration.secret = 'MCwCAQACBQDDym2lAgMBAAECBDHB'
  end

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.include FixturesHelper

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
