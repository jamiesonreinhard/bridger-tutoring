class Api::V1::StudentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update]

  def index
    appointments = policy_scope(Appointment)
    render json: appointments
  end

  def show
    render json: @appointment
  end

  def update
    if @appointment.update(appointment_params)
      render :show
    else
      render_error
    end
  end

  def create
    @appointment = Appointment.new(student_params)
    @appointment.user = current_user
    authorize @appointment
    if @appointment.save
      render :show, status: :created
    else
      render_error
    end
  end


  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def render_error
    render json: { errors: @appointment.errors.full_messages },
      status: :unprocessable_entity
  end

  def appointment_params
    params.require(:appointment).permit(:name, :date, :tutor_id, :student_id)
  end

end