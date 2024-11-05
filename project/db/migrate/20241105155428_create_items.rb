class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.references :order, null: false, foreign_key: true
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
