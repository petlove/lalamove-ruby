# frozen_string_literal: true

module Lalamove
  module Entities
    class QuotationLocation < Base
      attribute :lat, Types::String.optional
      attribute :lng, Types::String.optional
    end
  end
end
