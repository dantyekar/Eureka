class Administrator::OrdersController < Administrator::BaseController

  def index
    @orders = Order.all
  end
end