# frozen_string_literal: true

module Lalamove
  module Resources
    class Quotation < ActiveService::Base
      def initialize(params)
        @params = params
      end

      def perform
        process
      end

      private

      attr_reader :params

      def process
        Lalamove::Services::QuotationService.perform!(payload)
      end

      def deliveries
        [
          {
            toStop: 1,
            toContact: {
              name: customer_name,
              phone: "+55#{billing[:phone]}"
            },
            remarks: "ORDER #{params[:number]}"
          }
        ]
      end

      def long_address(address)
        "#{address[:address1]}, #{address[:house_number]} - #{address[:neighborhood]}, "\
        "#{address[:city]} - #{address[:state]}, #{address[:zipcode]}, Brazil"
      end

      def delivery_stops
        [params[:shipping_address], params[:shipping_address]].compact.map do |address|
          {
            # location: {
            #   lat: '-23.519658',
            #   lng: '-46.679692'
            # },
            addresses: {
              pt_BR: {
                displayString: long_address(address),
                country: 'BR_SAO'
              }
            }
          }
        end
      end

      def payload
        {
          # scheduleAt: (Time.now + 2).utc.iso8601,
          serviceType: 'LALAGO',
          stops: delivery_stops,
          deliveries: deliveries,
          requesterContact: {
            name: customer_name,
            phone: billing[:phone]
          },
          specialRequests: []
        }
      end

      def customer_name
        @customer_name ||= [billing[:firstname], billing[:lastname]].join(' ')
      end

      def billing
        @billing ||= params[:billing_address]
      end
    end
  end
end
