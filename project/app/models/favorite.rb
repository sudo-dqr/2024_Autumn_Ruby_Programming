class Favorite < ApplicationRecord
  belongs_to :user
  has_many :product_favorites, dependent: :destroy
  has_many :products, through: :product_favorites, dependent: :destroy
end
