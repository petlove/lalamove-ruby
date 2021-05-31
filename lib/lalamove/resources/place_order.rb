# frozen_string_literal: true

module Lalamove
  module Resources
    class PlaceOrder < OrderCreator
      private

      def quotation
        @quotation ||= Lalamove::Services::QuotationService.perform!(payload)
      end

      def creation
        Lalamove::Services::OrderCreatorService.perform!(
          payload_with_fee.merge(
            quotedTotalFee: {
              amount: quotation.data[:totalFee],
              currency: Lalamove.configuration.currency
            }
          )
        )
      end

      def process
        return quotation unless quotation.valid?

        creation
      end
    end
  end
end
