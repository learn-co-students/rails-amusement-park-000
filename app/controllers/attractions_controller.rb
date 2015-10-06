class AttractionsController < ApplicationController

def new
  @attraction = Attraction.new
end

def create
  @attraction = Attraction.create(attraction_params)
  @attraction.save
  redirect_to attraction_path(@attraction)
end

def edit
  @attraction = Attraction.find(params[:id]) 
end

def update
  @attraction = Attraction.find(params[:id]) 
  @attraction.update(attraction_params)
  redirect_to attraction_path(@attraction)
end


def index
  @user = User.find(session[:user_id])
  @attractions = Attraction.all
end

def show
  @user = User.find(session[:user_id])
  @attraction = Attraction.find(params[:id])
end


  private
  def attraction_params
      params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
      #there is another :password_confirmation attribute that is checked here, but that seems to not work for me.  CHECK!!
  end


end