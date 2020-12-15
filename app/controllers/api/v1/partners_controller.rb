class Api::V1::PartnersController < ApplicationController
  skip_before_action :authorized
  
  def index
    partners = policy_scope(Partner)
    render json: partners.map { |partner| partner_json(partner) }
  end

  def create
    @partner = Partner.create(partner_perameters)
    if @partner.save
      image = rails_blob_path(@partner.image)
      render json: { partner: @partner, image: image }
    end
  end

  private

  def partner_perameters
    params.require(:partner).permit(:name, :description, :image)
  end

  def partner_json(partner)
    image = rails_blob_path(partner.image)
    partner.as_json.merge(image: image)
  end
end