# frozen_string_literal: true

class RenameTablePackagesToProducts < ActiveRecord::Migration[7.0]
  def change
    remove_index(:packages, column: :discarded_at)
    remove_reference(:packages, :creator, index: true, foreign_key: { to_table: :users })
    remove_reference(:order_items, :package, index: true, foreign_key: true)

    rename_table(:packages, :products)

    add_index(:products, :discarded_at)
    add_reference(:products, :creator, foreign_key: { to_table: :users }, null: false)
    add_reference(:order_items, :product, foreign_key: true, null: false)
  end
end
