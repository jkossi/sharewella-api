# frozen_string_literal: true

class PhoneNumberVerfication < ApplicationRecord
  include PhoneNumberValidatable

  has_one_time_password interval: 120, after_column_name: :last_otp_at
  belongs_to :user, optional: true

  validates :phone_number, presence: true, uniqueness: true
  validates :user_id, uniqueness: { allow_nil: true }
end
