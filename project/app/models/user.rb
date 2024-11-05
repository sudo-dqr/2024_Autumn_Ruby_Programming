class User < ApplicationRecord
  belongs_to :role
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :favorite, dependent: :destroy
end
