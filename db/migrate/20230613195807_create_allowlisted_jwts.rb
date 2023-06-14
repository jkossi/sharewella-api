class CreateAllowlistedJwts < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    create_table :allowlisted_jwts do |t|
      t.string :jti, null: false
      t.string :aud, null: false
      t.datetime :exp, null: false
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end

    add_index :allowlisted_jwts, :jti, unique: true, algorithm: :concurrently
  end
end
