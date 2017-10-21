class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.save
      #send it back
    else
      # do something else ?
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
