require "test_helper"

class ProducttsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @productt = productts(:one)
  end

  test "should get index" do
    get productts_url
    assert_response :success
  end

  test "should get new" do
    get new_productt_url
    assert_response :success
  end

  test "should create productt" do
    assert_difference("Productt.count") do
      post productts_url, params: { productt: { name: @productt.name } }
    end

    assert_redirected_to productt_url(Productt.last)
  end

  test "should show productt" do
    get productt_url(@productt)
    assert_response :success
  end

  test "should get edit" do
    get edit_productt_url(@productt)
    assert_response :success
  end

  test "should update productt" do
    patch productt_url(@productt), params: { productt: { name: @productt.name } }
    assert_redirected_to productt_url(@productt)
  end

  test "should destroy productt" do
    assert_difference("Productt.count", -1) do
      delete productt_url(@productt)
    end

    assert_redirected_to productts_url
  end
end
