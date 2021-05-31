# frozen_string_literal: true

module Lalamove
  module Resources
    class OrderCreator < Quotation
      private

      def process
        Lalamove::Services::OrderCreatorService.perform!(payload_with_fee)
      end

      def payload_with_fee
        payload.merge(
          quotedTotalFee: {
            amount: orders.sum { |order| order[:cost].to_f }.to_s,
            currency: Lalamove.configuration.currency
          },
          sms: false,
          pod: true,
          fleetOption: 'FLEET_ALL'
        )
      end
    end
  end
end
