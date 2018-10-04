class OrdersController < ApplicationController

  def new
    if current_user.present?
      @cart = current_cart
      @order = Order.new
    else
      flash[:danger]= 'Please log in.'
      redirect_to login_path
    end
  end

  def create
    @cart = current_cart
  
    @order = Order.new(order_params)
    @order.add_order_items_from_cart(current_cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to(home_url, notice: 'Your order has been sent!')
    else
      redirect_to(home_url, notice: 'Something went wrong.. :(')
    end
  end

  def update
    if @order.update(status: order_params[:status])
      redirect_to admin_orders_path, notice: 'Order was successfully updated.'
    else
      redirect_to admin_orders_path, notice: 'An error occurred.'
    end
  end

  private

    def order_params
      params.require(:order).permit(:user_id, :status)
    end

end
