class OrderItemsController < ApplicationController
  before_action :set_order_item, only: :destroy

  def create
    @order_item = @cart.add_product(order_item_params[:product_id])
    if @order_item.save
      flash.now[:notice] = 'Item added to cart'
    else
      redirect_to home_path, notice: 'An error occurred while processing your request'
    end
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
      params.permit(:product_id)
    end

end
