# frozen_string_literal: true

class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product

  validates :product_id, uniqueness: { scope: :basket_id }
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
