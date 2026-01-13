require "application_system_test_case"

class BarbersTest < ApplicationSystemTestCase
  setup do
    @barber = barbers(:one)
  end

  test "visiting the index" do
    visit barbers_url
    assert_selector "h1", text: "Barbers"
  end

  test "should create barber" do
    visit barbers_url
    click_on "New barber"

    check "Active" if @barber.active
    fill_in "Barber shop", with: @barber.barber_shop_id
    fill_in "Name", with: @barber.name
    click_on "Create Barber"

    assert_text "Barber was successfully created"
    click_on "Back"
  end

  test "should update Barber" do
    visit barber_url(@barber)
    click_on "Edit this barber", match: :first

    check "Active" if @barber.active
    fill_in "Barber shop", with: @barber.barber_shop_id
    fill_in "Name", with: @barber.name
    click_on "Update Barber"

    assert_text "Barber was successfully updated"
    click_on "Back"
  end

  test "should destroy Barber" do
    visit barber_url(@barber)
    click_on "Destroy this barber", match: :first

    assert_text "Barber was successfully destroyed"
  end
end
