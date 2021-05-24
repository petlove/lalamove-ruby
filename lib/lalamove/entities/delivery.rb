# frozen_string_literal: true

module Lalamove
  module Entities
    class Delivery < Base
      attribute :toStop, Types::Strict::Integer
      attribute :toContact, Customer
      attribute :remarks, Types::String
    end
  end
end
