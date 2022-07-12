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
        if response.valid?
          response.data[:data][:amount] = result.data.dig(:data, :priceBreakdown, :total)
        end
      end

      def payloadable
        @payloadable ||= Entities::Order.new(params)
      end
    end
  end
end
