class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    mood_swing = happiness - nausea
    if mood_swing > 0
      "happy"
    else
      "sad"
    end
  end

end
