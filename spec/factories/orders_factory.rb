# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user
    status { :pending }
  end
end
