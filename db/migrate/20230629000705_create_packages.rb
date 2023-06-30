class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :name, null: false
      t.string :description
      t.text :long_description
      t.boolean :public, default: false
      t.monetize :price
      t.integer :frequency
      t.datetime :delivery_at
      t.integer :available_slots
      t.datetime :discarded_at 
      t.datetime :expires_at
      t.datetime :available_at
      t.monetize :retail_price

      t.timestamps
    end
    
    add_index :packages, :discarded_at

    safety_assured do
      add_reference(:packages, :creator, foreign_key: { to_table: :users })
    end
  end
end
