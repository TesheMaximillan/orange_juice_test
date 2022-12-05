class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_search_item_path, notice: 'User successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'User is not able to created.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
