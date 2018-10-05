class ApplicationController < ActionController::Base
  include SessionsHelper
  include SetCart
  protect_from_forgery with: :exception
  before_action :set_cart

end