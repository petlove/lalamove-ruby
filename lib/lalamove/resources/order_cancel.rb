# frozen_string_literal: true

module Lalamove
  module Resources
    class OrderCancel < ActiveService::Base
      def initialize(id)
        @id = id
      end

      def perform
        process
      end

      private

      attr_reader :id

      def process
        Lalamove::Services::OrderCancelService.perform!(payload)
      end

      def payload
        { id: id }
      end
    end
  end
end
