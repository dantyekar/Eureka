class Order < ApplicationRecord
  enum status: [:pending, :completed]
  
  belongs_to :user
  has_many :order_items
  
  def add_order_items(cart) 
    cart.order_items.each do |item|
      item.cart_id = nil
      order_items << item
    end 
  end

  def total_price
    order_items.to_a.sum(&:total_price)
  end
  
end