# frozen_string_literal: true

module Lalamove
  module Services
    class OrderCancelService < QuotationService
      private

      def process
        RequestService.perform!(action: :put, payload: {}, path: path)
      end

      def payloadable; end

      def path
        "/v2/orders/#{params[:id]}/cancel"
      end
    end
  end
end
