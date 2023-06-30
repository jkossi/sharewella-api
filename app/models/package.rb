# frozen_string_literal: true

class Package < ApplicationRecord
  enum :frequency,
    {
      daily: 0,
      weekly: 1,
      biweekly: 2,
      monthly: 3,
      yearly: 4,
    },
    default: :daily

  belongs_to :creator, class_name: "User"

  monetize :price_cents, allow_nil: false, numericality: { greater_than_or_equal_to: 0 }
  monetize :retail_price_cents, allow_nil: false, numericality: { greater_than_or_equal_to: 0 }
  validates :name, presence: true
end
