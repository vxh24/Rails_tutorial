require "application_system_test_case"

class ProducttsTest < ApplicationSystemTestCase
  setup do
    @productt = productts(:one)
  end

  test "visiting the index" do
    visit productts_url
    assert_selector "h1", text: "Productts"
  end

  test "should create productt" do
    visit productts_url
    click_on "New productt"

    fill_in "Name", with: @productt.name
    click_on "Create Productt"

    assert_text "Productt was successfully created"
    click_on "Back"
  end

  test "should update Productt" do
    visit productt_url(@productt)
    click_on "Edit this productt", match: :first

    fill_in "Name", with: @productt.name
    click_on "Update Productt"

    assert_text "Productt was successfully updated"
    click_on "Back"
  end

  test "should destroy Productt" do
    visit productt_url(@productt)
    click_on "Destroy this productt", match: :first

    assert_text "Productt was successfully destroyed"
  end
end
