# frozen_string_literal: true

module Lalamove
  module Entities
    class QuotationLocation < Base
      attribute :lat, Types::String
      attribute :lng, Types::String
    end
  end
end
