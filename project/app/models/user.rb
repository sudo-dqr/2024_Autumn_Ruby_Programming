class User < ApplicationRecord
  has_secure_password

  belongs_to :role
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :favorite, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
