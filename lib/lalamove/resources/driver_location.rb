# frozen_string_literal: true

module Lalamove
  module Resources
    class DriverLocation < DriverDetails
      private

      def process
        Lalamove::Services::DriverLocationService.perform!(order_id, driver_id)
      end
    end
  end
end
