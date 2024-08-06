require "test_helper"

class OrganizationProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_profile = organization_profiles(:one)
  end

  test "should get index" do
    get organization_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_profile_url
    assert_response :success
  end

  test "should create organization_profile" do
    assert_difference("OrganizationProfile.count") do
      post organization_profiles_url, params: { organization_profile: { description: @organization_profile.description, name: @organization_profile.name, organization_id: @organization_profile.organization_id } }
    end

    assert_redirected_to organization_profile_url(OrganizationProfile.last)
  end

  test "should show organization_profile" do
    get organization_profile_url(@organization_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_profile_url(@organization_profile)
    assert_response :success
  end

  test "should update organization_profile" do
    patch organization_profile_url(@organization_profile), params: { organization_profile: { description: @organization_profile.description, name: @organization_profile.name, organization_id: @organization_profile.organization_id } }
    assert_redirected_to organization_profile_url(@organization_profile)
  end

  test "should destroy organization_profile" do
    assert_difference("OrganizationProfile.count", -1) do
      delete organization_profile_url(@organization_profile)
    end

    assert_redirected_to organization_profiles_url
  end
end
