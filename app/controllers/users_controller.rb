class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.create(user_params)
    if @user.save
       render json: {id: @user.id, name: @user.name, interest: @user.interest}, status: :ok
    else
       render json: {status: "Error", message: "#{@user.errors.full_messages}"}, status: 400
    end
  end

  def search
    user = User.find(params[:id])
    user.longitude = params[:longitude]
    user.latitude = params[:latitude]
    user.save

    user.nearby.map { |user| {id: user.id, interest: user.interest} }.to_json
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :interest)
  end
end
