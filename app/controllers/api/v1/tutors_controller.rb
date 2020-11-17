class Api::V1::TutorsController < ApplicationController
  def index
    tutors = policy_scope(Tutor)
    render json: tutors
  end
end
