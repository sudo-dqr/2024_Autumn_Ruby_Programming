class CreateProductItems < ActiveRecord::Migration[7.2]
  def change
    create_table :product_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.datetime :added_at

      t.timestamps
    end
  end
end
