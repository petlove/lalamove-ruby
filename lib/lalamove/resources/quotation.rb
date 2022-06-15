# frozen_string_literal: true

module Lalamove
  module Resources
    class Quotation < ActiveService::Base
      def initialize(params)
        @params = params
        @stock_location = params[:stock_location]
        @orders = params[:orders].to_a
        @service_type = params[:service_type] || 'LALAGO'
      end

      def perform
        process
      end

      private

      attr_reader :params, :stock_location, :orders, :service_type

      def process
        Lalamove::Services::QuotationService.perform!(payload)
      end

      def long_address(address)
        "#{address[:address1]}, #{address[:house_number]}, #{address[:address2]} "\
        "- #{address[:neighborhood]}, #{address[:city]} - #{address[:state]}, "\
        "#{address[:zipcode]}, Brazil"
      end

      def delivery_stops
        stops = []
        stops << { address: stock_location[:address1] }

        orders.each do |order|
          stops << { address: long_address(order[:shipping_address]) }
        end

        stops
      end

      def payload
        {
          language: Lalamove.configuration.country,
          serviceType: service_type,
          stops: delivery_stops,
          specialRequests: []
        }
      end
    end
  end
end
