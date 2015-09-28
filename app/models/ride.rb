class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = User.find_by(id: user_id)
    @attraction = Attraction.find_by(id: attraction_id)
    height_and_tickets? || enough_tickets? || height? || update_attrs
  end

  def enough_tickets?
    if @user.tickets < @attraction.tickets
      return "Sorry. You do not have enough tickets the #{@attraction.name}."
    end
  end

  def height?
    if @user.height < @attraction.min_height
      return "Sorry. You are not tall enough to ride the #{@attraction.name}."
    end
  end

  def height_and_tickets?
    if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      return "Sorry. You do not have enough tickets for the #{@attraction.name}. You are also not tall enough to ride the #{@attraction.name}."
    end
  end

  def update_attrs
    @user.tickets = @user.tickets - @attraction.tickets
    @user.nausea = @user.nausea + @attraction.nausea_rating
    @user.happiness = @user.happiness + @attraction.happiness_rating
    @user.save
    "Thanks for riding the #{@attraction.name}!"
  end
end
