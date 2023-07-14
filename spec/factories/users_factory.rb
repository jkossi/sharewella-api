# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "Joseph Anthony" }
    password { "AQa123_56" }
    phone_number { "020#{rand(0..9)}13378#{rand(0..9)}" }
  end
end
