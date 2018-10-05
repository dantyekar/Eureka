class OrdersController < ApplicationController

  def new
    if current_user.present?
      @order = Order.new
    else
      flash[:danger]= 'Please log in.'
      redirect_to login_path
    end
  end

  def create  
    @order = Order.new(order_params)
    @order.add_order_items_from_cart(@cart)

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
