class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    check_user = check_user_height_and_tickets
    #if the user checks out, it returns true. else, it returns a message
    if check_user.include? ("Thanks")
      adjust_user_ticket_number
      update_user_nausea
      update_user_happiness
      "Thanks for riding the #{attraction.name}!"
    else
      check_user
    end
  end

  def check_user_height_and_tickets
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}." 
    else 
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def adjust_user_ticket_number
    self.user.tickets -= attraction.tickets
    user.save
  end

  def update_user_nausea
    self.user.nausea += attraction.nausea_rating
    user.save
  end

  def update_user_happiness
    self.user.happiness += attraction.happiness_rating
    user.save
  end
end
