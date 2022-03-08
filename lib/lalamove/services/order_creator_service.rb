# frozen_string_literal: true

module Lalamove
  module Services
    class OrderCreatorService < QuotationService
      private

      def process
        result = RequestService.perform!(action: :post, payload: { data: payloadable.to_h }, path: '/v3/orders')
        result.data[:amount] = result.data.dig(:data, :priceBreakdown, :total)
        result
      end

      def payloadable
        @payloadable ||= Entities::Order.new(params)
      end
    end
  end
end
