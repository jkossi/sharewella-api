# frozen_string_literal: true

class Package < ApplicationRecord
  enum status: {
    pending: 0,
    paid: 1,
  }

  belongs_to :creator, class_name: "User"
  validates :name, presence: true
end
