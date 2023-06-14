class AllowlistedJwt < ApplicationRecord
  belongs_to :user

  validates :aud, presence: true
  validates :exp, presence: true
  validates :jti, presence: true, uniqueness: true
end
