class ApplicationController < ActionController::Base
  include SessionsHelper
  include CurrentCart
  protect_from_forgery with: :exception
  before_action :set_cart

  private
  
    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound 
      cart = Cart.create 
      session[:cart_id] = cart.id
      cart
    end 

end