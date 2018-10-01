class Product < ApplicationRecord
  default_scope { order(name: :asc) }

  validates :name, :description, :image_url, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, uniqueness: true
end
