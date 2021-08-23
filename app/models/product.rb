class Product < ApplicationRecord
  belongs_to :shop
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_float: true }
  validates :amount, presence: true, numericality: { only_integer: true } # preguntar
  has_one_attached :image
end
