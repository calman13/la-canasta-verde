class Shop < ApplicationRecord
  belongs_to :user
  has_many :products
  validates :name, presence: true, uniqueness: true
  validates :history, presence: true
  has_one_attached :image
end
