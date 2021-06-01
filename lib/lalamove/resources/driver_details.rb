# frozen_string_literal: true

module Lalamove
  module Resources
    class DriverDetails < ActiveService::Base
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
        Lalamove::Services::DriverDetailsService.perform!(order_id, driver_id)
      end
    end
  end
end
