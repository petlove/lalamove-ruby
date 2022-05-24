# frozen_string_literal: true

module Lalamove
  module Resources
    class PlaceOrder < Quotation
      private

      def quotation
        @quotation ||= Lalamove::Services::QuotationService.perform!(payload)
      end

      def creation
        Lalamove::Services::OrderCreatorService.perform!(payload_with_detail_contact)
      end

      def process
        return quotation unless quotation.valid?

        creation
      end

      def delivery_stops_id
        quotation.data.dig(:data, :stops).map { |x| x[:stopId] }
      end

      def payload_with_detail_contact
        {
          quotationId: quotation.data.dig(:data, :quotationId),
          sender: {
            stopId: delivery_stops_id.first,
            name: stock_location[:name],
            phone: stock_location[:phone]
          },
          recipients: deliveries,
          isPODEnabled: true,
          isRecipientSMSEnabled: false
        }
      end

      def deliveries
        orders.each_with_index.map do |order, pos|
          shipping = order[:shipping_address]
          {
            stopId: delivery_stops_id[pos + 1],
            name: [shipping[:firstname], shipping[:lastname]].join(' '),
            phone: shipping[:phone],
            remarks: "ORDER #{order[:number]}"
          }
        end
      end
    end
  end
end
