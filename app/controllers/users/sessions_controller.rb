# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      render(
        json: {
          message: I18n.t("devise.sessions.signed_in"),
          data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
        },
        status: :ok,
      )
    end

    def respond_to_on_destroy
      log_out_success && return if current_user

      log_out_failure
    end

    def log_out_success
      render(json: { message: I18n.t("devise.sessions.signed_out") }, status: :ok)
    end

    def log_out_failure
      render(json: { message: I18n.t("devise.failure.unauthenticated") }, status: :unauthorized)
    end
  end
end
