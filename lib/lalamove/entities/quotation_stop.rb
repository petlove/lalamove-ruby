# frozen_string_literal: true

module Lalamove
  module Entities
    class QuotationStop < Base
      attribute :location, QuotationLocation.meta(omittable: true)
      attribute :addresses, AddressType
    end
  end
end
