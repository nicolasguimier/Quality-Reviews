class OrganisationsController < ApplicationController
  def index
    @organisations = current_user.organisations
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  def new
    @organisation = Organisation.new
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

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find(params[:id])
    @organisation.update(organisation_params)
    redirect_to organisation_path(@organisation)
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    redirect_to organisations_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :presentation, :facebook_link, :tripadvisor_link, :google_link, :yelp_link)
  end
end
