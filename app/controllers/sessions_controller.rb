class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
		log_in user
    redirect_to users_path
    else
      flash.now[:danger] = "Email/Password combination is not correct. Please try again."
    	render "new"
    end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end

  private 
    def logged_in_user
      if logged_in?
        redirect_to users_path
      end
    end

end
