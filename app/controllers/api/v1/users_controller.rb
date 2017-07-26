class Api::V1::UsersController < ApplicationController
  acts_as_token_authentication_handler_for User

  def show

  end
  
  def public
    result=Hash.new
    u = User.find_by id: params[:id]
    result["id"]=u.id
    result["name"]=u.name
    result["username"]=u.username
    result["address"]=u.address
    result["email"]=u.email
    render json: result
  end

  def private
    result = User.find_by id: params[:id]
    render json: result
  end

  def preferences
    result = Hash.new
    result["lorem"]="ipsum"
    render json: result
  end
  
  def index
    result=Array.new
    User.find_each do |u|
      result.push(u.id)
    end
    render json: result
  end

  def search

  end
  
  def create
  end

  def update
  end

  def destroy
    @user.destroy
  end

  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:user_id, :email, :id)
    end
end

