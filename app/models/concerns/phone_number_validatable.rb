# frozen_string_literal: true

module PhoneNumberValidatable
  extend ActiveSupport::Concern

  attr_accessor :phone_number_normalized

  included do
    phony_normalize :phone_number, as: :phone_number_normalized, default_country_code: "GH"
    validates_plausible_phone :phone_number_normalized, presence: true, if: :phone_number?
  end
end
