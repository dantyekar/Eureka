class Product < ApplicationRecord
  default_scope { order(name: :asc) }
  has_many :order_items

  validates :name, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :name, uniqueness: true

end
