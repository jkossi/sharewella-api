# frozen_string_literal: true

module SnakeCaseParamKeys
  extend ActiveSupport::Concern

  def snake_cased_params
    @_snake_cased_params ||= ActionController::Parameters.new(params.to_unsafe_h.deep_transform_keys!(&:underscore))
  end
end
