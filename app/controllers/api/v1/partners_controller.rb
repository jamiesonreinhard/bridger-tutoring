class Api::V1::PartnersController < ApplicationController
  def index
    partners = policy_scope(Partner)
    render json: partners
  end
end