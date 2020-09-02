class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You have successfully registered.'
      redirect_to root_path
    else
      flash.now[:alert] = 'Sorry, you have error in your form. Check and try again'
      render :new
    end
  end

  private

  # def set_user
  #   @user = User.find(params[:id])
  # end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
