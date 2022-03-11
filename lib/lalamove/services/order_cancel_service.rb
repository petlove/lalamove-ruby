# frozen_string_literal: true

module Lalamove
  module Services
    class OrderCancelService < QuotationService
      private

      def process
        RequestService.perform!(action: :delete, payload: nil, path: path)
      end

      def payloadable; end

      def path
        "/v3/orders/#{params[:id]}"
      end
    end
  end
end
