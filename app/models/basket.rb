# frozen_string_literal: true

class Basket < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: true
end
