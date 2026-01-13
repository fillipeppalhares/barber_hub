require "test_helper"

class BarberShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barber_shop = barber_shops(:one)
  end

  test "should get index" do
    get barber_shops_url
    assert_response :success
  end

  test "should get new" do
    get new_barber_shop_url
    assert_response :success
  end

  test "should create barber_shop" do
    assert_difference("BarberShop.count") do
      post barber_shops_url, params: { barber_shop: { address: @barber_shop.address, city: @barber_shop.city, document: @barber_shop.document, name: @barber_shop.name, phone: @barber_shop.phone } }
    end

    assert_redirected_to barber_shop_url(BarberShop.last)
  end

  test "should show barber_shop" do
    get barber_shop_url(@barber_shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_barber_shop_url(@barber_shop)
    assert_response :success
  end

  test "should update barber_shop" do
    patch barber_shop_url(@barber_shop), params: { barber_shop: { address: @barber_shop.address, city: @barber_shop.city, document: @barber_shop.document, name: @barber_shop.name, phone: @barber_shop.phone } }
    assert_redirected_to barber_shop_url(@barber_shop)
  end

  test "should destroy barber_shop" do
    assert_difference("BarberShop.count", -1) do
      delete barber_shop_url(@barber_shop)
    end

    assert_redirected_to barber_shops_url
  end
end
