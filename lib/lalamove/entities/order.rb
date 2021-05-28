# frozen_string_literal: true

module Lalamove
  module Entities
    class Order < Lalamove::Entities::Quotation
      attribute :fleetOption, Types::String.default('FLEET_ALL')
      attribute :sms, Types::Strict::Bool.default(true)
      attribute :pod, Types::Strict::Bool.default(false)
      attribute :quotedTotalFee, QuotedTotalFee
    end
  end
end
