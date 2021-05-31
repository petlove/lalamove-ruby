# frozen_string_literal: true

# frozen_string_literal: true

require 'lalamove/version'

require 'lalamove/configuration'
require 'lalamove/client'

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
require 'lalamove/entities/quoted_total_fee'
require 'lalamove/entities/order'

require 'lalamove/resources/quotation'
require 'lalamove/resources/order_creator'
require 'lalamove/resources/place_order'
require 'lalamove/resources/order_cancel'

require 'lalamove/services/request_service'
require 'lalamove/services/quotation_service'
require 'lalamove/services/order_creator_service'
require 'lalamove/services/order_cancel_service'

module Lalamove
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.client
    Client
  end
end
