# frozen_string_literal: true

require 'simplecov'
require 'simplecov_json_formatter'

module SimpleCovConfig
  def self.configure
    SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
    SimpleCov.minimum_coverage 90
    SimpleCov.start do
      add_filter { |source_file| cover?(source_file.lines) }
      add_filter '/spec/'
    end
  end

  def self.cover?(lines)
    !lines.detect { |line| line.src.match?(/(def |attributes)/) }
  end
end
