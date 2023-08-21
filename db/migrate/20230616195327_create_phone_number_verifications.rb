# frozen_string_literal: true

class CreatePhoneNumberVerifications < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_number_verifications do |t|
      t.string :otp_secret_key
      t.string :phone_number, null: false
      t.integer :last_otp_at

      t.timestamps
    end

    add_index(:phone_number_verifications, :phone_number, unique: true)
    add_reference(
      :phone_number_verifications,
      :user,
      foreign_key: true,
      index: { unique: true, algorithm: :concurrently },
    )
  end
end
