require 'test_helper'

class VotersControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert response.body.include?("Vanessa Voter")
  end

  # test "show is specific" do
  #   get :show, id: voters(:vanessa).id
  #
  #   assert_response :success
  #
  #   assert response.body.include?("Vanessa Voter")
  #   refute response.body.include?("Eddie Election")
  # end

end
