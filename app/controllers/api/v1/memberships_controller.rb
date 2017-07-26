class Api::V1::MembershipsController < ApplicationController
    
  def user
    u = User.find params[:user_id]
    result=Hash.new
    result["subscription"] = u.subscription
    result["gyms"] = Array.new
    u.subscription.gyms.find_each do |gym|
      gh = Hash.new
      gh["id"] = gym.id
      gh["name"] = gym.gym_name
      gh["address"] = gym.user.address
      result["gyms"].push(gh)
    end
    render json: result
  end

  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:membership).permit(:user_id, :email, :id)
    end
end

