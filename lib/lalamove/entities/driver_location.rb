# frozen_string_literal: true

module Lalamove
  module Entities
    class DriverLocation < Base
      attribute :location, Lalamove::Entities::Location
      attribute :updatedAt, Types::String
    end
  end
end
