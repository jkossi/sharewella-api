# frozen_string_literal: true

class Order < ApplicationRecord
  include Discard::Model

  enum status: {
    pending: 0,
    paid: 1,
  }

  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
end
