# frozen_string_literal: true

module Lalamove
  module Entities
    class Address < Base
      attribute :displayString, Types::Strict::String
      attribute :country, Types::Strict::String
    end
  end
end
