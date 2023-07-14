# frozen_string_literal: true

FactoryBot.define do
  factory :basket_item do
    basket
    product
    quantity { 1 }
  end
end
