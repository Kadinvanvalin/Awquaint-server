class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.save
       render json: {status: 'SUCCESS'}, status: :ok
    else
       render json: {status: "Error", message: "#{@user.errors.full_messages}"}, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
