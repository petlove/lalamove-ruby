# frozen_string_literal: true

module Lalamove
  module Services
    class OrderDetailService < QuotationService
      private

      def process
        RequestService.perform!(action: :get, payload: nil, path: path)
      end

      def payloadable; end

      def path
        "/v2/orders/#{params[:id]}"
      end
    end
  end
end
