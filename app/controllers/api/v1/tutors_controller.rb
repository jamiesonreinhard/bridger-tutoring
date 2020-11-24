class Api::V1::TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :update]
  skip_before_action :authorized

  def index
    tutors = policy_scope(Tutor)
    render json: tutors
  end

  def show
    render json: @tutor
  end

  def update
    if @tutor.update(tutor_params)
      render :show
    else
      render_error
    end
  end

  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.user = current_user
    authorize @tutor
    if @tutor.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def render_error
    render json: { errors: @tutor.errors.full_messages },
      status: :unprocessable_entity
  end

  def tutor_params
    params.require(:tutor).permit(:first_name, :last_name, :city, :state, :country, :occupation, :phone_number, :linked_in_link)
  end
end
