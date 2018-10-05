class CartsController < ApplicationController

  def show; end

  def destroy
    @cart.destroy 
    session[:cart_id] = nil
    redirect_to(home_url, :notice => 'Your cart is currently empty') 
  end

end
