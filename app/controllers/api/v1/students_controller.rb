class Api::V1::StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update]
  skip_before_action :authorized

  def index
    students = policy_scope(Student)
    render json: students.as_json(include: :appointments)
  end

  def show
    render json: @student
  end

  def update
    if @student.update(student_params)
      render :show
    else
      render_error
    end
  end

  def create
    p student_params
    @student = Student.create(student_params)
    authorize @student
    if @student.save
      avatar = rails_blob_path(@student.avatar)
      render json: {user: @student.user.as_json(include: {
        student: {
          include: :appointments
        }
      }, avatar: avatar)}
    else
      render_error
    end
  end


  private

  def set_student
    @student = Student.find(params[:id])
  end

  def render_error
    render json: { errors: @student.errors.full_messages },
      status: :unprocessable_entity
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :city, :state, :country, :school, :user_id, :avatar)
  end

end
