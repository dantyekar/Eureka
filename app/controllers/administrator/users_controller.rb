class Administrator::UsersController < Administrator::BaseController

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to administrator_users_url
  end
end