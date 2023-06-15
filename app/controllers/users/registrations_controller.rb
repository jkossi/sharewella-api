# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      register_success(resource) && return if resource.persisted?

      register_failed(resource)
    end

    def register_success(resource)
      render json: {
        message: I18n.t('devise.sessions.signed_in'),
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    end

    def register_failed(resource)
      render json: {
        message: I18n.t('errors.messages.not_saved', resource: resource.class.name, count: resource.errors.size),
        errors: resource.errors.messages
      }, status: :unprocessable_entity
    end
  end
end
