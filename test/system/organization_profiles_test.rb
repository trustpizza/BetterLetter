require "application_system_test_case"

class OrganizationProfilesTest < ApplicationSystemTestCase
  setup do
    @organization_profile = organization_profiles(:one)
  end

  test "visiting the index" do
    visit organization_profiles_url
    assert_selector "h1", text: "Organization profiles"
  end

  test "should create organization profile" do
    visit organization_profiles_url
    click_on "New organization profile"

    fill_in "Description", with: @organization_profile.description
    fill_in "Name", with: @organization_profile.name
    fill_in "Organization", with: @organization_profile.organization_id
    click_on "Create Organization profile"

    assert_text "Organization profile was successfully created"
    click_on "Back"
  end

  test "should update Organization profile" do
    visit organization_profile_url(@organization_profile)
    click_on "Edit this organization profile", match: :first

    fill_in "Description", with: @organization_profile.description
    fill_in "Name", with: @organization_profile.name
    fill_in "Organization", with: @organization_profile.organization_id
    click_on "Update Organization profile"

    assert_text "Organization profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Organization profile" do
    visit organization_profile_url(@organization_profile)
    click_on "Destroy this organization profile", match: :first

    assert_text "Organization profile was successfully destroyed"
  end
end
