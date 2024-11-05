class Product < ApplicationRecord
  has_many :product_items, dependent: :destroy
  has_many :items, through: :product_items, dependent: :destroy

  has_many :product_carts, dependent: :destroy
  has_many :carts, through: :product_carts, dependent: :destroy

  has_many :product_favorites, dependent: :destroy
  has_many :favorites, through: :product_favorites, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :sales, presence: true
end
