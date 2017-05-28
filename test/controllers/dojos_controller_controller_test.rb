require 'test_helper'

class DojosControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dojos_controller_index_url
    assert_response :success
  end

end
