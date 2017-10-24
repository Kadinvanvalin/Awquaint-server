class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       render json: {id: @user.id, name: @user.name, interest: @user.interest}, status: :ok
    else
      render json: {}, status: 400
    end
  end
end
