class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    att = Attraction.find(self.attraction_id)
    usr = User.find(self.user_id)
    if att.tickets > usr.tickets && att.min_height > usr.height
      return "Sorry. You do not have enough tickets the #{att.name}. You are not tall enough to ride the #{att.name}."
    elsif att.tickets > usr.tickets
      return "Sorry. You do not have enough tickets the #{att.name}."
    elsif att.min_height > usr.height
      return "Sorry. You are not tall enough to ride the #{att.name}."
    else
      new_tix = usr.tickets - att.tickets
      new_nausea = usr.nausea + att.nausea_rating
      new_happiness = usr.happiness + att.happiness_rating
      usr.update(tickets: new_tix)
      usr.update(nausea: new_nausea)
      usr.update(happiness: new_happiness)
    end
  end



  
end
