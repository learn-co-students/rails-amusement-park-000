class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_id(params["user"]["id"])
    session[:user_id] = user.id
    flash[:notice] = "Hello, #{user.name}!"
    redirect_to "/users/#{user.id}"
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out successfully."
    redirect_to root_url
  end

end
