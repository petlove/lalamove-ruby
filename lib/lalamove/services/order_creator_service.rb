# frozen_string_literal: true

module Lalamove
  module Services
    class OrderCreatorService < QuotationService
      private

      def process
        result = RequestService.perform!(action: :post, payload: payloadable.to_h, path: '/v2/orders')
        result.data[:amount] = payloadable.quotedTotalFee.amount if result.valid?
        result
      end

      def payloadable
        @payloadable ||= Entities::Order.new(params)
      end
    end
  end
end
