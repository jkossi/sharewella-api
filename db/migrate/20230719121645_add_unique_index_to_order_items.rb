# frozen_string_literal: true

class AddUniqueIndexToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_index(:order_items, [:product_id, :order_id], unique: true)
  end
end
