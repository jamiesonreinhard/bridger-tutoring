class Api::V1::StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update]
  skip_before_action :authorized

  def index
    students = policy_scope(Student)
    render json: students
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
    @student = Student.new(student_params)
    @student.user = current_user
    # authorize @student
    if @student.save
      render :show, status: :created
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
    params.require(:student).permit(:first_name, :last_name, :city, :state, :country, :school, :id)
  end

end
