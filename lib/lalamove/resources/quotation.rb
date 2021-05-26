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
        {

          deliveries: [
            {
              toStop: 1,
              toContact: {
                name: customer_name,
                phone: billing[:phone]
              },
              remarks: "ORDER #{params[:number]}"
            }
          ]
        }
      end

      def delivery_stops
        [params[:shipping_address]].compact.map do |address|
          {
            location: {
              lat: '13.740167',
              lng: '100.535237'
            },
            addresses: [
              pt_BR: {
                displayString: [address[:addres1], address[:house_number]].join(', '),
                country: 'BR'
              }
            ]
          }
        end
      end

      def payload
        {
          scheduleAt: Time.now.utc.to_s,
          serviceType: 'MOTORCYCLE',
          stops: delivery_stops,
          **deliveries,
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
