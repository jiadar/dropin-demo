class Api::V1::SubscriptionsController < ApplicationController
    
  def user
    u = User.find params[:user_id]
    render json: u.subscription
  end

  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:subscription).permit(:user_id, :email, :id)
    end
end

