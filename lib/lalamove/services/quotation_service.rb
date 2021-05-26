# frozen_string_literal: true

module Lalamove
  module Services
    class QuotationService < ActiveService::Base
      def initialize(params = {})
        @params = params
      end

      def perform
        process
      end

      private

      attr_reader :params

      def process
        RequestService.perform!(action: :post, payload: payloadable.to_h, path: '/v2/quotations')
      end

      def payloadable
        @payloadable ||= Entities::Quotation.new(params)
      end
    end
  end
end
