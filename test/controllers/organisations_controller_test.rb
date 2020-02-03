require 'test_helper'

class OrganisationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organisations_index_url
    assert_response :success
  end

  test "should get show" do
    get organisations_show_url
    assert_response :success
  end

  test "should get create" do
    get organisations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get organisations_destroy_url
    assert_response :success
  end

end
