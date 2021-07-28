require "test_helper"

class SuperAdmin::SubscriptionPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get super_admin_subscription_plans_index_url
    assert_response :success
  end

  test "should get new" do
    get super_admin_subscription_plans_new_url
    assert_response :success
  end

  test "should get show" do
    get super_admin_subscription_plans_show_url
    assert_response :success
  end

  test "should get edit" do
    get super_admin_subscription_plans_edit_url
    assert_response :success
  end
end
