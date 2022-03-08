# frozen_string_literal: true

module Lalamove
  module Entities
    class Order < Base
      attribute :quotationId, Types::String
      attribute :sender, OrderSender
      attribute :recipients, Types::Strict::Array.of(OrderSender)
      attribute :isRecipientSMSEnabled, Types::Bool.meta(omittable: true)
      attribute :isPODEnabled, Types::Bool
    end
  end
end
