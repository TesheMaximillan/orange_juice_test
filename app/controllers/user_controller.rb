class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      render json: {
        logged_in: true,
        user: {
          id: user.id,
          username: user.username,
        }
      }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user
      render json: {
        logged_in: true,
        user: {
          id: user.id,
          username: user.username,
        }
      }, status: :ok
    else
      render json: { errors: ['Invalid username'] }, status: :unauthorized
    end
  end

  def logout
    render json: {logged_in: false, user: {}}, status: :ok
  end

  private

  def user_params
    params.permit(:username)
  end
end
