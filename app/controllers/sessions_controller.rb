class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: session_params[:username])

    if @user
      session[:user_id] = @user.id
      redirect_to search_items_path, notice: 'Logged in!'
    else
      redirect_to sessions_path, alert: 'User not found!'
    end
  end

  def logout
    reset_session
    redirect_to sessions_path, notice: 'Logged out!'
  end

  private

  def session_params
    params.permit(:username)
  end
end
