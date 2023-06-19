class CreatePhoneNumberVerfications < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_number_verfications do |t|
      t.string :otp_secret_key
      t.string :phone_number
      t.datetime :last_otp_at

      t.timestamps
    end

    add_index :phone_number_verfications, :phone_number, unique: true
    add_reference :phone_number_verfications, :user, foreign_key: true, index: { unique: true, algorithm: :concurrently }
  end
end
