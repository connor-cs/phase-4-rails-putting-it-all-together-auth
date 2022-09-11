class UsersController < ApplicationController
  skip_before_action :authorize, only: :create
  
  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user, status :created
    else
      render { error: user.errors.full_messages }, status: :unprocessabile_entity
  end

  def show
      render json: @current_user
  end
  
  
  private

  def user_params
    params.permit(:username, :password_digest, :image_url, :bio)
  end

end
