# frozen_string_literal: true

module Lalamove
  module Entities
    class Order < Quotation
      attribute :quotedTotalFee, QuotedTotalFee
      attribute :sms, Types::Bool.meta(omittable: true)
      attribute :pod, Types::Bool
      attribute :fleetOption, Types::String
    end
  end
end
