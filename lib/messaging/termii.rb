# frozen_string_literal: true

module Messaging
  class Termii
    API_BASE_URL = "https://api.ng.termii.com"

    class << self
      def send_sms(to, options = {})
        body = {
          to: to,
          api_key: options.fetch(:api_key, Rails.application.credentials.messaging.termii_api_key!),
          from: options.fetch(:from, "ShareWella"),
          sms: options.fetch(:sms),
          type: options.fetch(:type, "plain"),
          channel: options.fetch(:channel, "generic"),
        }

        response = client.post("/api/sms/send", body)

        if response.success?
          { success: true }
        else
          # TODO: log this in our error monitoring tool
          { success: false, message: response.reason_phrase }
        end
      rescue Faraday::Error => e
        # TODO: log this error in our error monitoring tool
        { success: false, message: e.message }
      end

      private

      def client
        @client ||= Faraday.new(url: API_BASE_URL, headers: { "Content-Type" => "application/json" }) do |connection|
          connection.request(:json)
          connection.response(:json)
        end
      end
    end
  end
end
