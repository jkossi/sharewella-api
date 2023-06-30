FactoryBot.define do
  factory :order_item do
    order
    package
    quantity { 1 }
  end
end
