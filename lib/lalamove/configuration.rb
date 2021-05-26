# frozen_string_literal: true

module Lalamove
  class Configuration
    attr_accessor :host, :secret, :production

    PRODUCTION = 'https://rest.lalamove.com'
    SANDBOX    = 'https://sandbox-rest.lalamove.com'

    def initialize
      @host = production ? PRODUCTION : SANDBOX
      @secret = ''
    end
  end
end
