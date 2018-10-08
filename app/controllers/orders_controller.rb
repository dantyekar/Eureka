class OrdersController < ApplicationController
  before_action :authorize_user, only: [:new, :create, :update]

  def new
    @order = Order.new
  end

  def create  
    @order = Order.new(order_params)
    @order.add_order_items(@cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to(home_url, notice: 'Your order has been sent!')
    else
      redirect_to(home_url, notice: 'Something went wrong.. :(')
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(status: order_params[:status])
      redirect_to admin_orders_path, notice: "Order ##{@order.id} was successfully updated."
    else
      redirect_to admin_orders_path, notice: 'An error occurred.'
    end
  end

  private

    def order_params
      params.require(:order).permit(:user_id, :status)
    end

end
