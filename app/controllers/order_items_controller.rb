class OrderItemsController < ApplicationController
  before_action :set_order_item, only: :destroy

  def create
    @cart = current_cart
    @order_item = @cart.add_product(params[:product_id])
    
    redirect_to home_path, notice: 'An error occurred while processing your request' unless @order_item.save
  end

  def destroy
    @order_item.destroy
    redirect_to cart_path(@cart)
  end

  private

    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:product_id, :cart_id)
    end

end
