# frozen_string_literal: true

module Lalamove
  module Services
    class DriverLocationService < DriverDetailsService
      private

      def path
        "/v2/orders/#{order_id}/drivers/#{driver_id}/location"
      end
    end
  end
end
