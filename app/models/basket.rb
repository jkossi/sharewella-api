# frozen_string_literal: true

class Basket < ApplicationRecord
  belongs_to :user
  has_many :basket_items, dependent: :destroy
  has_many :products, through: :basket_items

  validates :user_id, uniqueness: true
end
