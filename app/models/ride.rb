class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  attr_reader :invalid_ride

####SHOULD NOT HAVE GONE DOWN THE ERRORS PATH ON THIS ONE! ! ! !
  def not_tall_enough
    errors.add(:height, "You do not have enough tickets the #{attraction.name}.") if user.tickets < attraction.tickets
    errors[:height].first
  end

  def not_enough_tickets   
    errors.add(:tickets, "You are not tall enough to ride the #{attraction.name}.") if user.height < attraction.min_height
    errors[:tickets].first
  end

  def ineligibility_response
    if not_tall_enough || not_enough_tickets
      apology = "Sorry. "
    end
    if not_tall_enough && not_enough_tickets
      apology + not_tall_enough + " " + not_enough_tickets
    elsif not_enough_tickets
      apology + not_enough_tickets
    elsif not_tall_enough
      apology + not_tall_enough
    end
  end

  def take_ride
    if ineligibility_response
      @invalid_ride = 1
      ineligibility_response
    else
      @invalid_ride = 0
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    end
  end

end
