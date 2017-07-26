class GymsController < ApplicationController
  before_action :authenticate_user!
  
  # TODO: (ross) need to write before action to match logged in user with gym
  
  def home
    @cur_gym = current_user.gym
  end

  def checkin
    
    @cur_gym = current_user.gym

    # here is the query
    # select gyms.gym_name, users.name, events.name, instructor, description,
    # events.date from events_registrations, registrations, events, users, gyms
    # where events.gym_id=gyms.id and registrations.user_id=users.id and
    # events_registrations.registration_id = registrations.id and
    # events_registrations.event_id = events.id;

    # TODO: (ross) This only works with the first event in the database for demo!
    # TODO: (ross) To fix either have time based query or most likely, pick from a list
    # TODO: (ross) of upcoming events
    
    @e = Event.first
    @r = @e.registrations

  end

  def reservations
    @id = params["format"]
    @cur_gym = Gym.find_by_id(@id)
  end

  def user_info
    @id = params["format"]
    @cur_gym = Gym.find_by_id(@id)
  end

  def memberships
    @id = params["format"]
    @cur_gym = Gym.find_by_id(@id)
  end
  
  private

    # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:user_id, :email, :id)
  end

end

