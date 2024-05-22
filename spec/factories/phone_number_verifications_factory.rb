# frozen_string_literal: true

FactoryBot.define do
  factory :phone_number_verification do
    phone_number { "020#{rand(0..9)}13378#{rand(0..9)}" }
  end
end
