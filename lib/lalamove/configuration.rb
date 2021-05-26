# frozen_string_literal: true

module Lalamove
  class Configuration
    attr_accessor :host, :production, :secret, :token

    PRODUCTION = 'https://rest.lalamove.com'
    SANDBOX    = 'https://sandbox-rest.lalamove.com'

    def initialize
      @host = production ? PRODUCTION : SANDBOX
      @secret = ''
      @token = ''
    end
  end
end
