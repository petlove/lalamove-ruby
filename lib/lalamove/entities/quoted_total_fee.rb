module Lalamove
  module Entities
    class QuotedTotalFee < Base
      attribute :amount, Types::Strict::String
      attribute :currency, Types::Strict::String
    end
  end
end