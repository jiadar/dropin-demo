class Api::V1::GymsController < ApplicationController
  acts_as_token_authentication_handler_for User
    
  def find_by_id
    g = Gym.find_by id: params[:id]
    u = User.find_by gym_id: params[:id]
    result = Hash.new
    result = g.attributes.merge(u.attributes)
    render json: result
  end

  def index
    result=Array.new
    Gym.find_each do |u|
      result.push(u.id)
    end
    render json: result
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

    # Only allow a trusted parameter "white list" through.
    def gym_params
      params.require(:user).permit(:user_id, :email, :id)
    end
end

