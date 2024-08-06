class OrganizationProfilesController < ApplicationController
  before_action :set_organization_profile, only: %i[show edit update destroy]
  before_action :authenticate_organization! # Ensure the organization is signed in

  # GET /organization_profiles or /organization_profiles.json
  def index
    @organization_profiles = OrganizationProfile.all
  end

  # GET /organization_profiles/1 or /organization_profiles/1.json
  def show
  end

  # GET /organization_profiles/new
  def new
    @organization_profile = current_organization.organization_profiles.build
  end

  # GET /organization_profiles/1/edit
  def edit
  end

  # POST /organization_profiles or /organization_profiles.json
  def create
    @organization_profile = current_organization.organization_profiles.build(organization_profile_params)

    respond_to do |format|
      if @organization_profile.save
        format.html { redirect_to organization_profile_url(@organization_profile), notice: "Organization profile was successfully created." }
        format.json { render :show, status: :created, location: @organization_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_profiles/1 or /organization_profiles/1.json
  def update
    respond_to do |format|
      if @organization_profile.update(organization_profile_params)
        format.html { redirect_to organization_profile_url(@organization_profile), notice: "Organization profile was successfully updated." }
        format.json { render :show, status: :ok, location: @organization_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_profiles/1 or /organization_profiles/1.json
  def destroy
    @organization_profile.destroy!

    respond_to do |format|
      format.html { redirect_to organization_profiles_url, notice: "Organization profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_profile
      @organization_profile = OrganizationProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_profile_params
      params.require(:organization_profile).permit(:name, :description, :logo)
    end
end
