# frozen_string_literal: true

module Lalamove
  module Resources
    class OrderDetail < OrderCancel
      private

      def process
        Lalamove::Services::OrderDetailService.perform!(payload)
      end
    end
  end
end
