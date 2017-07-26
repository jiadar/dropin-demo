class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def checkin
    id = params["id"]
    r=Registration.find(id)
    r.checked_in = true
    r.save    
    redirect_to gyms_checkin_path
  end

end

