# frozen_string_literal: true

class CreateBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.datetime :discarded_at
      t.timestamps
    end
  
    add_index :baskets, :discarded_at
  end
end
