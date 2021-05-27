# frozen_string_literal: true

require 'vcr'

module VcrConfig
  class << self
    def configure(config)
      allow_cassettes
      config.after(:suite) { VcrConfig.check_unused_cassettes } if all_files?(config)
    end

    def all_files?(config)
      (Dir['spec/**/*_spec.rb'] - config.files_to_run).empty?
    end

    def filters(config)
      config.filter_sensitive_data('TOKEN') { ENV['TOKEN'] }
      config.filter_sensitive_data('SECRET') { ENV['SECRET'] }
    end

    def allow_cassettes
      VCR.configure do |config|
        config.allow_http_connections_when_no_cassette = true
        config.cassette_library_dir = 'spec/cassettes'
        config.hook_into :webmock
        config.ignore_localhost = true
        config.configure_rspec_metadata!
        filters(config)
        config.default_cassette_options = { match_requests_on: %i[method host path] }
        config.before_record { |i| i.response.body.force_encoding('UTF-8') }
      end
    end

    def check_unused_cassettes
      return unless unused_cassettes.any?

      puts '', '--- These cassettes are unused ---'
      unused_cassettes.each { puts " - #{_1}" }

      raise 'Check unused cassetes'
    end

    private

    def unused_cassettes
      @unused_cassettes ||=
        Dir.glob('spec/cassettes/**/*.yml').map(&File.method(:expand_path)) - UsedCassettes.all
    end

    def env?(env)
      ENV[env] == 'true'
    end
  end

  class UsedCassettes
    class << self
      def add(item)
        @list ||= []
        @list << item
      end

      def all
        @list || []
      end
    end
  end
end
