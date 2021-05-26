# frozen_string_literal: true

module Lalamove
  module Entities
    class QuotationStop < Base
      attribute :location, QuotationLocation
      attribute :addresses, Types::Strict::Array.of(AddressType)
    end
  end
end
