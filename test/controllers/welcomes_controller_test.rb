require 'test_helper'

class WelcomesControllerTest < ActionDispatch::IntegrationTest
  test "should get about_me" do
    get welcomes_about_me_url
    assert_response :success
  end

end
