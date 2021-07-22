# frozen_string_literal: true

module Lalamove
  class Configuration
    attr_accessor :production, :secret, :token, :currency, :country, :city

    PRODUCTION = 'https://rest.lalamove.com'
    SANDBOX    = 'https://rest.sandbox.lalamove.com'

    def initialize
      @production = false
      @secret = ''
      @token = ''
      @currency = ''
      @country = ''
      @city = ''
    end

    def host
      @host ||= production ? PRODUCTION : SANDBOX
    end
  end
end
