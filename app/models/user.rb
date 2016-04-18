class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    unless nausea && happiness
      return "not enough info to figure out"
    end
    if nausea > happiness
      "sad"
    else
      "happy"
    end
  end

end
