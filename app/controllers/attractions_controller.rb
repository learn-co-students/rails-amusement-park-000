class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :update, :riding, :edit]

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    @attraction.save
    redirect_to "/attractions/#{@attraction.id}"
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to "/attractions/#{@attraction.id}"
  end

  def riding
    @user = User.find(session[:user_id])
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    flash[:notice] = @ride.take_ride 
    redirect_to "/users/#{@user.id}"
  end

  private
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:id, :name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end
