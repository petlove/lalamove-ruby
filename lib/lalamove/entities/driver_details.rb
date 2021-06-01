# frozen_string_literal: true

module Lalamove
  module Entities
    class DriverDetails < Base
      attribute :name, Types::String
      attribute :phone, Types::String
      attribute :plateNumber, Types::String
      attribute :photo, Types::String
    end
  end
end
