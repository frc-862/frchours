require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get members" do
    get :members
    assert_response :success
  end

  test "should get hours" do
    get :hours
    assert_response :success
  end

end
