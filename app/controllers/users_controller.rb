class UsersController < ApplicationController

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      @user = User.find(params["user"]["id"])
      session[:user_id] = @user.id
      redirect_to user_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    else
    render :new
    end 
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(session[:user_id])
    if params["format"]
        @attraction = Attraction.find(params["format"])
        red = Ride.create(attraction_id: @attraction.id, user_id: @user.id)
        if red.take_ride == true
          flash[:notice] = "Thanks for riding the #{@attraction.name}!"
          redirect_to user_path(@user)
        else
          flash[:notice] = red.take_ride
          redirect_to user_path(@user)
        end
      end
  end


  def test
    binding.pry
  end

   private
  def user_params
      params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :admin)
      #there is another :password_confirmation attribute that is checked here, but that seems to not work for me.  CHECK!!
  end



end