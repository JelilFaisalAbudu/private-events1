class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You have successfully registered.'
      redirect_to user_path(@user)
    else
      flash.now[:alert] = 'Error. Your registration was unsuccesful'
      render 'new'
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
