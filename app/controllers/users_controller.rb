class UsersController < ApplicationController
  before_action :authorize_user, only: [:index, :edit, :update, :destroy]
  before_action :check_current_user,   only: [:show, :edit, :update]
  before_action :authorize_admin,     only: :destroy

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Eureka Caffee!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def authorize_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def check_current_user
      @user = User.find(params[:id])
      redirect_to(home_path) unless current_user?(@user)
    end

    def authorize_admin
      redirect_to(home_path) unless current_user.admin?
    end
end