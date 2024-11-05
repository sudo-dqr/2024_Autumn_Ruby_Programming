class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :quantity
      t.datetime :added_at

      t.timestamps
    end
  end
end
