class Api::V1::FavoritesController < ApplicationController
    
  def user
    u = User.find params[:user_id]
    result=Hash.new
    fav = u.favorites 
    result = Array.new
    fav.find_each do |f|
      rh=Hash.new
      rh["rank"] = f.rank
      rh["gym"] = f.gym
      result.push(rh)
    end
    render json: result
  end

  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:membership).permit(:user_id, :email, :id)
    end
end

