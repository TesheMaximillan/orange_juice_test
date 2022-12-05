class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    username = session_params[:username].strip.capitalize
    @user = User.find_by(username: username)

    if @user
      session[:user_id] = @user.id
      redirect_to new_search_item_path, notice: 'Logged in!'
    else
      redirect_to new_session_path, alert: 'User not found!'
    end
  end

  def logout
    reset_session
    redirect_to new_session_path, notice: 'Logged out!'
  end

  private

  def session_params
    params.require(:user).permit(:username)
  end
end
