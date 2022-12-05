class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      redirect_to search_items_path, notice: 'User created!'
    else
      render :new, alert: 'User not created!'
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user
      redirect_to search_items_path, notice: 'Logged in!'
    else
      redirect_to login_path, notice: 'Invalid username'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out!'
  end

  private

  def user_params
    params.permit(:username)
  end
end
