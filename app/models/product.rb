# frozen_string_literal: true

class Product < ApplicationRecord
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
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :basket_items, dependent: :destroy

  monetize :price_cents, allow_nil: false, numericality: { greater_than_or_equal_to: 0 }
  monetize :retail_price_cents, allow_nil: false, numericality: { greater_than_or_equal_to: 0 }
  validates :name, presence: true
end
