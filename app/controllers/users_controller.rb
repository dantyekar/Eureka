class UsersController < ApplicationController
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :check_current_user, only: [:show, :edit, :update]
  before_action :authorize_admin, only: :destroy
  before_action :set_user, only: [:edit, :update]

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the Eureka Caffee!'
      redirect_to @user
    else
      flash.now[:danger] = 'Please verify the information and try again.'
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def check_current_user
      @user = User.find(params[:id])
      redirect_to(home_path) unless current_user?(@user)
    end

    def authorize_admin
      redirect_to(home_path) unless current_user.admin?
    end

end