# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist
  include Discard::Model

  attr_accessor :phone_number_normalized

  devise :database_authenticatable,
    :trackable,
    :recoverable,
    :jwt_authenticatable,
    :registerable,
    authentication_keys: [:phone_number],
    jwt_revocation_strategy: self

  # Avoid Devise authenticating users using session
  self.skip_session_storage = [:http_auth, :params_auth]

  EMAIL_REGEX = /\A[\w+\-'.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PIN_REGEX = /\A(?!(\d)\1{3})\d{4}\Z/
  NAME_REGEX = /\A[a-zA-Z .-]+\Z/i

  encrypts :pin

  has_one :basket, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :packages, inverse_of: "creator", dependent: :destroy

  default_scope { kept }

  validates :name,
    presence: true,
    format: { with: NAME_REGEX, if: ->(user) { user.name.present? } }

  validates :pin,
    length: { minimum: 4, maximum: 4, if: ->(user) { user.pin.present? } },
    format: { with: PIN_REGEX, allow_nil: true }

  validates :email,
    format: { with: EMAIL_REGEX, allow_nil: true },
    uniqueness: { allow_nil: true, case_sensitive: false, conditions: -> { where(discarded_at: nil) } }

  validates :phone_number,
    presence: true,
    uniqueness: { conditions: -> { where(discarded_at: nil) } }

  phony_normalize :phone_number, as: :phone_number_normalized, default_country_code: "GH"
  validates_plausible_phone :phone_number_normalized, presence: true, if: :phone_number?
end
