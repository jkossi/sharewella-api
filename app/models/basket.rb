# frozen_string_literal: true

class Basket < ApplicationRecord
  belongs_to :user
  has_many :basket_items, dependent: :destroy

  validates :user_id, uniqueness: true
end
