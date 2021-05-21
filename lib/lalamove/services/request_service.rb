# frozen_string_literal: true

module Lalamove
  module Services
    class RequestService < ActiveService::Base
      LALAMOVE_HOST  = ENV['LALAMOVE_HOST']
      LALAMOVE_TOKEN = ENV['LALAMOVE_TOKEN']

      def initialize(params = {})
        @params  = params
        @payload = params[:payload]
      end

      def perform
        result = connection.send(params[:action], payload.to_json)
        data   = JSON.parse(result.body, symbolize_names: true)
        response(result.status.to_s.start_with?('20') ? { data: data } : { errors: data })
      end

      private

      attr_reader :params, :payload

      def connection
        @connection ||= Faraday.new(
          url: "#{LALAMOVE_HOST}#{params[:path]}",
          headers: headers,
          request: {
            open_timeout: 5,
            timeout: 10
          }
        )
      end

      def headers
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
      end
    end
  end
end
