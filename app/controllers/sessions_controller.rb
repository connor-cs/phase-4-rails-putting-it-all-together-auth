class SessionsController < ApplicationController

  def destroy
    params.delete :user_id
    head :no_content
  end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:username])
      session[:user_id] = user.id
      render json: user
    else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
  end

end
