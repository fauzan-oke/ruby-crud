require "application_system_test_case"

class DepartementsTest < ApplicationSystemTestCase
  setup do
    @departement = departements(:one)
  end

  test "visiting the index" do
    visit departements_url
    assert_selector "h1", text: "Departements"
  end

  test "should create departement" do
    visit departements_url
    click_on "New departement"

    fill_in "Name", with: @departement.name
    click_on "Create Departement"

    assert_text "Departement was successfully created"
    click_on "Back"
  end

  test "should update Departement" do
    visit departement_url(@departement)
    click_on "Edit this departement", match: :first

    fill_in "Name", with: @departement.name
    click_on "Update Departement"

    assert_text "Departement was successfully updated"
    click_on "Back"
  end

  test "should destroy Departement" do
    visit departement_url(@departement)
    click_on "Destroy this departement", match: :first

    assert_text "Departement was successfully destroyed"
  end
end
