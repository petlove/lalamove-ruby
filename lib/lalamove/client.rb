# frozen_string_literal: true

module Lalamove
  class Client
    class << self
      def quotation
        Lalamove::Resources::Quotation
      end

      def order_creator
        Lalamove::Resources::OrderCreator
      end

      def place_order
        Lalamove::Resources::PlaceOrder
      end

      def order_cancel
        Lalamove::Resources::OrderCancel
      end

      def order_detail
        Lalamove::Resources::OrderDetail
      end
    end
  end
end
