require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = profiles(:one)
  end

  test "visiting the index" do
    visit profiles_url
    assert_selector "h1", text: "Profiles"
  end

  test "creating a Profile" do
    visit profiles_url
    click_on "New Profile"

    fill_in "Address", with: @profile.address
    fill_in "Atitude", with: @profile.atitude
    fill_in "Country", with: @profile.country
    fill_in "Description", with: @profile.description
    fill_in "Image", with: @profile.image
    fill_in "Longitude", with: @profile.longitude
    fill_in "Name", with: @profile.name
    click_on "Create Profile"

    assert_text "Profile was successfully created"
    click_on "Back"
  end

  test "updating a Profile" do
    visit profiles_url
    click_on "Edit", match: :first

    fill_in "Address", with: @profile.address
    fill_in "Atitude", with: @profile.atitude
    fill_in "Country", with: @profile.country
    fill_in "Description", with: @profile.description
    fill_in "Image", with: @profile.image
    fill_in "Longitude", with: @profile.longitude
    fill_in "Name", with: @profile.name
    click_on "Update Profile"

    assert_text "Profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Profile" do
    visit profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profile was successfully destroyed"
  end
end
