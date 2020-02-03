class OrganisationsController < ApplicationController
  def index
    @organisations = current_user.organisations
    @organisation = Organisation.new
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user = current_user
    if @organisation.save
      redirect_to organisation_path(@organisation)
    else
      raise
    end
  end

  def destroy
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :presentation, :facebook_link, :tripadvisor_link, :google_link, :yelp_link)
  end
end
