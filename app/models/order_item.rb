# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :package

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
