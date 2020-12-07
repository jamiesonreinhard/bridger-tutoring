class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]
  

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token, avatar: @user.avatar}
    else
      render json: {error: "Invalid email or password!"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      if @user.role == "student"
        render json: {
          user: @user.as_json(include: { 
            student: {
          include: :appointments
          }
        }), token: token}
      else
        render json: {
          user: @user.as_json(include: { 
            tutor: {
          include: :appointments
          }
        }), token: token}
      end
    else
      render json: {error: "Invalid email or password!"}
    end
  end


  def auto_login
    render json: @user
  end

  # LOGGING OUT
  def logout
    
  end

  private

  def user_params
    params.permit(:email, :password_digest, :role, :avatar)
  end

end
