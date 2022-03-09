# frozen_string_literal: true

module Lalamove
  module Services
    class DriverDetailsService < ActiveService::Base
      def initialize(order_id, driver_id)
        @order_id = order_id
        @driver_id = driver_id
      end

      def perform
        process
      end

      private

      attr_reader :order_id, :driver_id

      def process
        RequestService.perform!(action: :get, payload: nil, path: path)
      end

      def payloadable; end

      def path
        "/v3/orders/#{order_id}/drivers/#{driver_id}"
      end
    end
  end
end
