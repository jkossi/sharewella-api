# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.datetime :discarded_at
      t.timestamps
    end

    add_index :orders, :discarded_at
  end
end
