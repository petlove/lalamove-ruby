# frozen_string_literal: true

module Lalamove
  module Resources
    class PlaceOrder < OrderCreator
      private

      def quotation
        @quotation ||= Lalamove::Services::QuotationService.perform!(payload)
      end

      def creation
        Lalamove::Services::OrderCreatorService.perform!(payload)
      end

      def process
        return quotation unless quotation.valid?

        creation
      end

      def payload
        super.merge(
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
