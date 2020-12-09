class Api::V1::TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :update]
  skip_before_action :authorized

  def index
    tutors = policy_scope(Tutor)
    render json: tutors.as_json(include: :appointments)
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
    @tutor = Tutor.create(tutor_params)
    authorize @tutor
    if @tutor.save
      avatar = rails_blob_path(@tutor.avatar)
      render json: {user: @tutor.user.as_json(include: {
        tutor: {
          include: :appointments
        }
      }, avatar: avatar)}
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
    params.require(:tutor).permit(:first_name, :last_name, :city, :state, :country, :occupation, :phone_number, :linked_in_link, :user_id, :summary, :avatar)
  end
end
