class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.integer :state
      t.datetime :completed_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
