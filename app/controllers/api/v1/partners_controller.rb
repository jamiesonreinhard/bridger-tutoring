class Api::V1::PartnersController < ApplicationController
  skip_before_action :authorized
  
  def index
    partners = policy_scope(Partner)
    render json: partners
  end

  private

  def partner_perameters
    params.require(:partner).permit(:name, :description, :image)
  end
end