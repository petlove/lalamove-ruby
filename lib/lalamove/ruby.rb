# frozen_string_literal: true

require_relative 'ruby/version'

module Lalamove
  module Ruby
    class Error < StandardError; end

    require 'active_service/base'
    require 'active_service/response'
    require 'faraday'

    require 'lalamove/entities/base'
    require 'lalamove/entities/address'
    require 'lalamove/entities/address_type'
    require 'lalamove/entities/customer'
    require 'lalamove/entities/delivery'
    require 'lalamove/entities/quotation_location'
    require 'lalamove/entities/quotation_stop'
    require 'lalamove/entities/quotation'

    require 'lalamove/services/request_service'
  end
end
