# frozen_string_literal: true

module Lalamove
  module Entities
    class OrderSender < Base
      attribute :stopId, Types::String
      attribute :name, Types::String
      attribute :phone, Types::String
    end
  end
end