# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
    rescue_from ActiveRecord::RecordNotSaved, with: :not_saved
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

    private

    def not_valid(e)
      errors = e.record.errors

      render(
        json: {
          code: "RECORD_FAILED_VALIDATION",
          message: errors.full_messages.to_sentence,
          errors: errors.messages,
        },
        status: :unprocessable_entity,
      )
    end

    def not_destroyed(e)
      errors = e.record.errors

      render(
        json: {
          code: "RECORD_NOT_DESTROYED",
          message: errors.full_messages.to_sentence,
          errors: errors.messages,
        },
        status: :unprocessable_entity,
      )
    end

    def not_saved(e)
      render(
        json: {
          code: "RECORD_NOT_SAVED",
          message: "Could not save #{e.record.class}",
        },
        status: :unprocessable_entity,
      )
    end

    def not_found(e)
      render(
        json: {
          code: "RECORD_NOT_FOUND",
          message: "Could not find #{e.model}",
        },
        status: :not_found,
      )
    end

    def not_unique
      render(json: { code: "RECORD_NOT_UNIQUE" }, status: :unprocessable_entity)
    end
  end
end
