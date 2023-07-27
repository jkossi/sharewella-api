# frozen_string_literal: true

module Messaging
  class SendOtp < BaseService
    # @param phone_number [String] The phone number in international format e.g 233547000000
    # @param code [String] The six(6) digit OTP code we want to send e.g '256367'
    #
    # @return [self]
    def initialize(phone_number:, code:)
      @phone_number = phone_number
      @code = code
    end

    def perform
      response = Messaging::Termii.send_sms(phone_number, sms: I18n.t("messaging.otp_sms", code: code))

      fail!(response[:message]) unless response[:success]
    end

    private

    attr_reader :phone_number, :code
  end
end
