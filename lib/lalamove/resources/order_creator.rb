# frozen_string_literal: true

module Lalamove
  module Resources
    class OrderCreator < Quotation
      private

      def process
        Lalamove::Services::OrderCreatorService.perform!(payload)
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

      def payload
        super.merge(
          quotedTotalFee: {
            amount: '108000',
            currency: 'BRL'
          },
          sms: false,
          pod: true,
          fleetOption: 'FLEET_ALL'
        )
      end
    end
  end
end
