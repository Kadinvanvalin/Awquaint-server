class SessionsController < ApplicationController
  def create
    # does session id work in swift/mobile?
    @user = User.find(email: params[:email])
    if @user && @user.authenticate(params[:password])
      # log them in?
    else
      # error
    end
  end

  def destroy
    #logout?
  end
end
