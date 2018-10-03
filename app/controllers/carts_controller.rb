class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def show
  end

  def destroy
    @cart = current_cart 
    @cart.destroy 
    session[:cart_id] = nil
    redirect_to(home_url, :notice => 'Your cart is currently empty') 
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.fetch(:cart, {})
    end
end
