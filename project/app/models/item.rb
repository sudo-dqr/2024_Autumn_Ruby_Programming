class Item < ApplicationRecord
  belongs_to :order
  has_many :product_items, dependent: :destroy
  has_many :products, through: :product_items, dependent: :destroy

  validates :quantity, presence: true
  validates :price, presence: true
end
