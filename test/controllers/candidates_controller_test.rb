require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

  test "should get index" do
    get :index
    assert_response :success
    assert response.body.include?("Porkbarrel Pete")
  end

  test "show is specific" do
    get :show, id: candidates(:pete).id

    assert_response :success

    assert response.body.include?("Porkbarrel Pete")
    refute response.body.include?("Leftwing Larry")
  end

end
