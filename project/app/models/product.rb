class Product < ApplicationRecord
  hasmany :product_items, dependent: :destroy
  hasmany :items, through: :product_items, dependent: :destroy

  hasmany :product_carts, dependent: :destroy
  hasmany :carts, through: :product_carts, dependent: :destroy

  hasmany :product_favorites, dependent: :destroy
  hasmany :favorites, through: :product_favorites, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :sales, presence: true
end
