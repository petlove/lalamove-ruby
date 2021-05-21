# frozen_string_literal: true

require_relative 'ruby/version'

module Lalamove
  module Ruby
    class Error < StandardError; end

    require 'active_service/base'
    require 'active_service/response'
    require 'faraday'
    require 'lalamove/services/request_service'
  end
end
