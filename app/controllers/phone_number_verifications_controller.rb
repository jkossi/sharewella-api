# frozen_string_literal: true

class PhoneNumberVerificationsController < ActionController::API
  include ExceptionHandler
  include SnakeCaseParamKeys

  def create
    phone_number_verification = PhoneNumberVerification.create!(verification_params)

    send_sms(phone_number_verification)
  end

  def verify_otp
    phone_number_verification = PhoneNumberVerification.find_by!(phone_number: verify_otp_params[:phone_number])

    if phone_number_verification.authenticate_otp(verify_otp_params[:code])
      head(:ok)
    else
      render(json: { code: "OTP_VERIFICATION_FAILED" }, status: :unauthorized)
    end
  end

  def resend_otp
    phone_number_verification = PhoneNumberVerification.find_by!(phone_number: verify_otp_params[:phone_number])

    send_sms(phone_number_verification)
  end

  private

  def send_sms(phone_number_verification)
    normalize_number = PhonyRails.normalize_number(
      phone_number_verification.phone_number,
      format: :international,
      country_code: :GH,
      add_plus: false,
    )

    service = Messaging::SendOtp.perform(
      phone_number: normalize_number,
      code: phone_number_verification.otp_code,
    )

    if service.success?
      head(:ok)
    else
      render(json: { code: "TERMII_SMS_FAILED", message: service.error }, status: :unprocessable_entity)
    end
  end

  def verification_params
    snake_cased_params.permit(:phone_number)
  end

  def verify_otp_params
    snake_cased_params.permit(:phone_number, :code)
  end
end
