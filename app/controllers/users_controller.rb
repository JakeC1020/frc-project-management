class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :update, :edit]
  before_action :correct_user, only: [:update, :edit]

  def index
    @users = User.all
  end


  def show
  end


  def new
    @user = User.new
  end


  def edit
  end


  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first, :last, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        redirect_to login_url        
      end
    end

    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end
end
