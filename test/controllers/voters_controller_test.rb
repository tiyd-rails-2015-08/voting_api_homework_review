require 'test_helper'

class VotersControllerTest < ActionController::TestCase

  test "show is specific" do
    get :show, id: voters(:vanessa).id, access_token: voters(:vanessa).access_token

    assert_response :success

    assert response.body.include?("Vanessa Voter")
    refute response.body.include?("Eddie Election")
  end

  test "show requires correct token" do
    get :show, id: voters(:vanessa).id, access_token: voters(:vanessa).access_token + "garbage"

    assert_response :success

    assert response.body.include?("recount")
  end

  test "update can work" do
    patch :update, id: voters(:vanessa).id, access_token: voters(:vanessa).access_token, name: "Marion"

    assert_response :success

    refute response.body.include?("Vanessa Voter")
    assert response.body.include?("Marion")
    assert response.body.include?(voters(:vanessa).party)
  end

  test "update needs correct token" do
    patch :update, id: voters(:vanessa).id, access_token: voters(:vanessa).access_token + "garbage"

    assert_response :success

    assert response.body.include?("recount")
  end

  test "update can fail" do
    patch :update, id: voters(:vanessa).id, access_token: voters(:vanessa).access_token, name: voters(:eddie).name

    assert_response :success

    assert response.body.include?("has already been taken")
  end

end
