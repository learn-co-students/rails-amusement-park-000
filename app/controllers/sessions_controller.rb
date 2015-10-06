class SessionsController < ApplicationController

  def new
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    else
      @user = User.find(params["user"]["id"])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def create
    binding.pry
    redirect_to root_path
  end

  def show
    @user = User.find(params["user_id"])
     if @user
       session[:user_id] = @user.id
       redirect_to user_path(@user)
    else
       redirect_to root_path
    end
  end

  def destroy
   session[:user_id] = nil
    redirect_to root_url
  end


end