# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    creator factory: :user
    name { "Jumbo size Indomie" }
    frequency { :daily }
  end
end
