class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login, :update]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid email or password"}
    end
  end

  def auto_login
    render json: @user
  end
  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid email or password"}
    end
  end
  def update
    if @user.update(user_params)
      render json: { message: 'User updated successfully', user: @user }
    else
      render json: { error: 'Unable to update user' }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: { message: 'User deleted successfully' }, status: :ok
    else
      render json: { error: 'Unable to delete user' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :bio, :twitter_handle)
  end


end
