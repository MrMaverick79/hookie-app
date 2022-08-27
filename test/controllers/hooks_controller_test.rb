require 'test_helper'

class HooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hooks_new_url
    assert_response :success
  end

  test "should get create" do
    get hooks_create_url
    assert_response :success
  end

  test "should get index" do
    get hooks_index_url
    assert_response :success
  end

  test "should get show" do
    get hooks_show_url
    assert_response :success
  end

  test "should get edit" do
    get hooks_edit_url
    assert_response :success
  end

  test "should get update" do
    get hooks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get hooks_destroy_url
    assert_response :success
  end

end
