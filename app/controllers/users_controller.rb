class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}", :notice => "Thank you for signing up!"
    else
      render :new
    end
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :name, :height, :happiness, :nausea, :tickets, :admin)
    end
end
