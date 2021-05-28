# frozen_string_literal: true

module Lalamove
  module Entities
    class Order < Lalamove::Entities::Quotation
      attribute :sms, Types::Strict::Bool
      attribute :pod, Types::Strict::Bool
      attribute :fleetOption, Types::String.optional
      attribute :quotedTotalFee, QuotedTotalFee
    end
  end
end
