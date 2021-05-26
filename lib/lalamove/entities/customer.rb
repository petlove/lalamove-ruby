# frozen_string_literal: true

module Lalamove
  module Entities
    class Customer < Base
      attribute :name, Types::String
      attribute :phone, Types::String
    end
  end
end
