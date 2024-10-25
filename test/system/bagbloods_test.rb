require "application_system_test_case"

class BagbloodsTest < ApplicationSystemTestCase
  setup do
    @bagblood = bagbloods(:one)
  end

  test "visiting the index" do
    visit bagbloods_url
    assert_selector "h1", text: "Bagbloods"
  end

  test "should create bagblood" do
    visit bagbloods_url
    click_on "New bagblood"

    fill_in "Donor", with: @bagblood.donor_id
    fill_in "Volume", with: @bagblood.volume
    click_on "Create Bagblood"

    assert_text "Bagblood was successfully created"
    click_on "Back"
  end

  test "should update Bagblood" do
    visit bagblood_url(@bagblood)
    click_on "Edit this bagblood", match: :first

    fill_in "Donor", with: @bagblood.donor_id
    fill_in "Volume", with: @bagblood.volume
    click_on "Update Bagblood"

    assert_text "Bagblood was successfully updated"
    click_on "Back"
  end

  test "should destroy Bagblood" do
    visit bagblood_url(@bagblood)
    click_on "Destroy this bagblood", match: :first

    assert_text "Bagblood was successfully destroyed"
  end
end
