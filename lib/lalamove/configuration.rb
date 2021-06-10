# frozen_string_literal: true

module Lalamove
  class Configuration
    attr_accessor :host, :production, :secret, :token, :currency, :country, :city

    PRODUCTION = 'https://rest.lalamove.com'
    SANDBOX    = 'https://rest.sandbox.lalamove.com'

    def initialize
      @host = production ? PRODUCTION : SANDBOX
      @secret = ''
      @token = ''
      @currency = ''
      @country = ''
      @city = ''
    end
  end
end
