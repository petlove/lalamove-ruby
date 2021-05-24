# frozen_string_literal: true

require 'dry-struct'
require 'dry-types'

module Lalamove
  module Entities
    module Types
      include Dry.Types()
    end

    class Base < Dry::Struct
      transform_keys(&:to_sym)
    end
  end
end
