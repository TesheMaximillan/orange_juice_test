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

  private

  def user_params
    params.permit(:username)
  end
end
