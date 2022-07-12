# frozen_string_literal: true

module Lalamove
  module Services
    class OrderCreatorService < QuotationService
      private

      def process
        result = RequestService.perform!(action: :post, payload: payloadable.to_h, path: '/v3/orders')
        set_amount(result)
        result
      end

      def set_amount(response)
        response.data[:data][:amount] = response.data.dig(:data, :priceBreakdown, :total) if response.valid?
      end

      def payloadable
        @payloadable ||= Entities::Order.new(params)
      end
    end
  end
end
