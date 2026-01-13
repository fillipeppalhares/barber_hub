require "application_system_test_case"

class BarberShopsTest < ApplicationSystemTestCase
  setup do
    @barber_shop = barber_shops(:one)
  end

  test "visiting the index" do
    visit barber_shops_url
    assert_selector "h1", text: "Barber shops"
  end

  test "should create barber shop" do
    visit barber_shops_url
    click_on "New barber shop"

    fill_in "Address", with: @barber_shop.address
    fill_in "City", with: @barber_shop.city
    fill_in "Document", with: @barber_shop.document
    fill_in "Name", with: @barber_shop.name
    fill_in "Phone", with: @barber_shop.phone
    click_on "Create Barber shop"

    assert_text "Barber shop was successfully created"
    click_on "Back"
  end

  test "should update Barber shop" do
    visit barber_shop_url(@barber_shop)
    click_on "Edit this barber shop", match: :first

    fill_in "Address", with: @barber_shop.address
    fill_in "City", with: @barber_shop.city
    fill_in "Document", with: @barber_shop.document
    fill_in "Name", with: @barber_shop.name
    fill_in "Phone", with: @barber_shop.phone
    click_on "Update Barber shop"

    assert_text "Barber shop was successfully updated"
    click_on "Back"
  end

  test "should destroy Barber shop" do
    visit barber_shop_url(@barber_shop)
    click_on "Destroy this barber shop", match: :first

    assert_text "Barber shop was successfully destroyed"
  end
end
