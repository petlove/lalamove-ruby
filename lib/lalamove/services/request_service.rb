# frozen_string_literal: true

module Lalamove
  module Services
    class RequestService < ActiveService::Base
      def initialize(params = {})
        @params  = params
        @payload = params[:payload].to_json
      end

      def perform
        result = connection.send(params[:action], params[:path], payload)

        return response(errors: result.reason_phrase, status: result.status) unless result.success?

        response(data: JSON.parse(result.body, symbolize_names: true), status: result.status)
      end

      private

      attr_reader :params, :payload

      def connection
        @connection ||= Faraday.new(
          url: Lalamove.configuration.host,
          headers: headers,
          request: {
            open_timeout: 5,
            timeout: 10
          }
        )
      end

      def timestamp
        @timestamp ||= Time.now.utc.to_i
      end

      def signature
        "#{timestamp}\r\n#{params[:action]}\r\n#{params[:path]}\r\n\r\n#{payload}"
      end

      def authorization
        OpenSSL::HMAC.hexdigest('sha256', Lalamove.configuration.secret, signature)
      end

      def token
        "#{Lalamove.configuration.token}:#{timestamp}:#{authorization}"
      end

      def headers
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "hmac #{token}",
          'X-LLM-Country': 'pt_BR',
          'X-Request-ID': timestamp.to_s
        }
      end
    end
  end
end
