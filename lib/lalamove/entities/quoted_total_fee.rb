# frozen_string_literal: true

module Lalamove
  module Entities
    class QuotedTotalFee < Base
      attribute :amount, Types::String
      attribute :currency, Types::String
    end
  end
end
