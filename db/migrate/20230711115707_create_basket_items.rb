# frozen_string_literal: true

class CreateBasketItems < ActiveRecord::Migration[7.0]
  def change
    create_table :basket_items do |t|
      t.references :basket, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.timestamps
    end
    add_index(:basket_items, [:product_id, :basket_id], unique: true)
  end
end

