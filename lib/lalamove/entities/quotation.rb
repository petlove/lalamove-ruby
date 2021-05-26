# frozen_string_literal: true

module Lalamove
  module Entities
    class Quotation < Base
      attribute :serviceType, Types::String
      attribute :stops, Types::Strict::Array.of(QuotationStop)
      attribute :deliveries, Types::Strict::Array.of(Delivery)
      attribute :requesterContact, Customer
      attribute :scheduleAt, Types::String
      attribute :specialRequests, Types::Array
    end
  end
end
