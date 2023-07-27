# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
  validates :product_id, uniqueness: { scope: :order_id }
end
