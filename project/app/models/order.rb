class Order < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :total, presence: true
  validates :state, presence: true
end
