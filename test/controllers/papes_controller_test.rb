require 'test_helper'

class PapesControllerTest < ActionDispatch::IntegrationTest
  test "should get help" do
    get papes_help_url
    assert_response :success
  end

end
