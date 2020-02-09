class OrganisationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @organisations = current_user.organisations.order(:id)
    # @organisations = policy_scope(Organisation)
  end

  def show
    @organisation = Organisation.friendly.find(params[:id])

    @links = {}
    @links[:tripadvisor] = @organisation.tripadvisor_link if @organisation.tripadvisor_link.present?
    @links[:facebook] = convert_facebook_link(@organisation.facebook_link) if @organisation.facebook_link.present?
    @links[:google] = convert_google_link(@organisation.google_link) if @organisation.google_link.present?
    @links[:yelp] = @organisation.yelp_link if @organisation.yelp_link.present?

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
    @organisation = Organisation.friendly.find(params[:id])
    raise unless @organisation.user == current_user
  end

  def update
    # @organisation = Organisation.find(params[:id])
    @organisation = current_user.organisations.friendly.find(params[:id])
    # authorize @organisation
    raise unless @organisation.user == current_user

    if @organisation.update(organisation_params)
      redirect_to organisations_path
    else
      render :edit
    end
  end

  def destroy
    @organisation = Organisation.friendly.find(params[:id])
    raise unless @organisation.user == current_user

    @organisation.destroy
    redirect_to organisations_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :presentation, :facebook_link, :tripadvisor_link, :google_link, :yelp_link)
  end

  def convert_google_link(g_link)
    return "https://search.google.com/local/writereview?placeid=" + g_link
  end

  def convert_facebook_link(bf_link)
    bf_link.gsub! ':', '%3A'
    bf_link.gsub! '/', '%2F'
    return "https://www.facebook.com/login/?next=" + bf_link
  end
end
