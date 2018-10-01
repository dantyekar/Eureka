class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def change
    Cart.all.each do |cart|
      sums = cart.order_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity| 
        if quantity > 1
          cart.order_items.where(product_id: product_id).delete_all
          cart.order_items.create(product_id: product_id, quantity: quantity)
        end 
      end
    end
  end
end
