class CreateFavorites < ActiveRecord::Migration[7.2]
  def change
    create_table :favorites do |t|
      t.datetime :added_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
