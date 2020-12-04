class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized

  def show
    render json: current_user
  end
end