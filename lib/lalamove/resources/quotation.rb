# frozen_string_literal: true

module Lalamove
  module Resources
    class Quotation < ActiveService::Base
      def initialize(params)
        @params = params
        @stock_location = params[:stock_location]
        @orders = params[:orders].to_a
      end

      def perform
        process
      end

      private

      attr_reader :params, :stock_location, :orders

      def process
        Lalamove::Services::QuotationService.perform!(payload)
      end

      def deliveries
        orders.each_with_index.map do |order, pos|
          shipping = order[:shipping_address]
          {
            toStop: pos + 1,
            toContact: {
              name: [shipping[:firstname], shipping[:lastname]].join(' '),
              phone: "+55#{shipping[:phone]}"
            },
            remarks: "ORDER #{order[:number]}"
          }
        end
      end

      def long_address(address)
        "#{address[:address1]}, #{address[:house_number]}, #{address[:address2]} "\
        "- #{address[:neighborhood]}, #{address[:city]} - #{address[:state]}, "\
        "#{address[:zipcode]}, Brazil"
      end

      def addresses(address, country)
        {
          addresses: {
            # location: {
            #   lat: '-23.519658',
            #   lng: '-46.679692'
            # },
            pt_BR: {
              displayString: address,
              country: country
            }
          }
        }
      end

      def delivery_stops
        stops = []
        stops << addresses(stock_location[:address1], 'BR_SAO')

        orders.each { |order| stops << addresses(long_address(order[:shipping_address]), 'BR_SAO') }

        stops
      end

      def payload
        {
          # scheduleAt: (Time.now).utc.iso8601,
          serviceType: 'LALAGO',
          stops: delivery_stops,
          deliveries: deliveries,
          requesterContact: {
            name: stock_location[:name],
            phone: stock_location[:phone]
          },
          specialRequests: []
        }
      end
    end
  end
end
