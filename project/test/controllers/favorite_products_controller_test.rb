require "test_helper"

class FavoriteProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_products_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_products_destroy_url
    assert_response :success
  end
end
