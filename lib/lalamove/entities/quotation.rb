# frozen_string_literal: true

module Lalamove
  module Entities
    class Quotation < Base
      attribute :language, Types::String
      attribute :serviceType, Types::String
      attribute :stops, Types::Strict::Array.of(QuotationStop)
      attribute :scheduleAt, Types::String.meta(omittable: true)
      attribute :specialRequests, Types::Array
    end
  end
end
