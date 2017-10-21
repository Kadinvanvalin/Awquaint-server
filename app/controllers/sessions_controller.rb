class SessionsController < ApplicationController
  def create
    # does session id work in swift/mobile?
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       render json: {id: @user.id, name: @user.name, interest: @user.interest}, status: :ok
    else
      render json: {status: "error", message: "Invalid email and/or password" }, status: 400
    end
  end

  def destroy
    #logout?
  end
end
