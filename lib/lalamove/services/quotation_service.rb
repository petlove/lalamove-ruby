# frozen_string_literal: true

module Lalamove
  module Services
    class QuotationService < ActiveService::Base
      def initialize(params = {})
        @params  = params
      end

      def perform
        response
      end

      private

      attr_reader :params,

      def payloadable
        {
          # "serviceType": "MOTORCYCLE",
          # "stops": [<Waypoint>],
          # "deliveries": [<DeliveryInfo>],
          # "requesterContact": <Contact>,
          # "scheduleAt": "2020-09-01T14:30:00.00Z",
          # "specialRequests": ["COD", "HELP_BUY", "LALABAG"]
        }
      end
    end
  end
end
