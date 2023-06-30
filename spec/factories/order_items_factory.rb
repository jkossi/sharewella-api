# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    order
    package
    quantity { 1 }
  end
end
