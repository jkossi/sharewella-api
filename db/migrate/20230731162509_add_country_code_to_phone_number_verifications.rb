# frozen_string_literal: true

class AddCountryCodeToPhoneNumberVerifications < ActiveRecord::Migration[7.0]
  def change
    add_column(:phone_number_verifications, :country_code, :string, default: "GH")
  end
end
