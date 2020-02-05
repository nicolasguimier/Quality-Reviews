class OrganisationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @organisations = current_user.organisations
    # @organisations = policy_scope(Organisation)
  end

  def show
    @organisation = Organisation.find(params[:id])
    if @organisation.facebook_link.present?
      @facebook_link = convert_facebook_link(@organisation.facebook_link)
    end

    render layout: 'organisation'
  end

  def new
    @organisation = Organisation.new
    # authorize @organisation
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user = current_user
    # authorize @organisation
    raise unless @organisation.save

    redirect_to organisations_path
  end

  def edit
    @organisation = Organisation.find(params[:id])
    raise unless @organisation.user == current_user
  end

  def update
    # @organisation = Organisation.find(params[:id])
    @organisation = current_user.organisations.find(params[:id])
    # authorize @organisation
    raise unless @organisation.user == current_user

    if @organisation.update(organisation_params)
      redirect_to organisations_path
    else
      render :edit
    end
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    raise unless @organisation.user == current_user

    @organisation.destroy
    redirect_to organisations_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :presentation, :facebook_link, :tripadvisor_link, :google_link, :yelp_link)
  end

  def convert_facebook_link(bf_link)
    bf_link.gsub! ':', '%3A'
    bf_link.gsub! '/', '%2F'
    new_link = "https://www.facebook.com/login/?next=" + bf_link
    return new_link
  end
end
