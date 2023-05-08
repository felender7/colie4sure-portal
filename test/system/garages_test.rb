require "application_system_test_case"

class GaragesTest < ApplicationSystemTestCase
  setup do
    @garage = garages(:one)
  end

  test "visiting the index" do
    visit garages_url
    assert_selector "h1", text: "Garages"
  end

  test "creating a Garage" do
    visit garages_url
    click_on "New Garage"

    fill_in "License plate", with: @garage.license_plate
    fill_in "Make", with: @garage.make
    fill_in "Model", with: @garage.model
    fill_in "Year", with: @garage.year
    click_on "Create Garage"

    assert_text "Garage was successfully created"
    click_on "Back"
  end

  test "updating a Garage" do
    visit garages_url
    click_on "Edit", match: :first

    fill_in "License plate", with: @garage.license_plate
    fill_in "Make", with: @garage.make
    fill_in "Model", with: @garage.model
    fill_in "Year", with: @garage.year
    click_on "Update Garage"

    assert_text "Garage was successfully updated"
    click_on "Back"
  end

  test "destroying a Garage" do
    visit garages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Garage was successfully destroyed"
  end
end
