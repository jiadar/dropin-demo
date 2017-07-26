class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @username = current_user.username
    if (current_user.is_gym)
      @user_has_a_gym = true;
      @gym_data = current_user.gym;
    end
  end
  
  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:user_id, :email, :id)
    end
end

