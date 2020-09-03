class SessionsController < ApplicationController
  def new
    # return unless logged_in?
    # flash[:notice] = 'You are already logged in'
    # redirect_to root_path
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      # log the user in and direct to show page
      log_in(user)
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email. Try again' # Log in not
      render 'new' # Try once more
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have logged out.'
    redirect_to root_path
  end
end
