# frozen_string_literal: true

module Lalamove
  module Entities
    class Address < Base
      attribute :displayString, Types::String
      attribute :country, Types::String
    end
  end
end
