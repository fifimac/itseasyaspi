require 'test_helper'

class UserprofilesControllerTest < ActionController::TestCase
  setup do
    @userprofile = userprofiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userprofiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userprofile" do
    assert_difference('Userprofile.count') do
      post :create, userprofile: { : @userprofile., avatar: @userprofile.avatar, bio: @userprofile.bio, location: @userprofile.location, user_id: @userprofile.user_id, username: @userprofile.username, website: @userprofile.website }
    end

    assert_redirected_to userprofile_path(assigns(:userprofile))
  end

  test "should show userprofile" do
    get :show, id: @userprofile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userprofile
    assert_response :success
  end

  test "should update userprofile" do
    put :update, id: @userprofile, userprofile: { : @userprofile., avatar: @userprofile.avatar, bio: @userprofile.bio, location: @userprofile.location, user_id: @userprofile.user_id, username: @userprofile.username, website: @userprofile.website }
    assert_redirected_to userprofile_path(assigns(:userprofile))
  end

  test "should destroy userprofile" do
    assert_difference('Userprofile.count', -1) do
      delete :destroy, id: @userprofile
    end

    assert_redirected_to userprofiles_path
  end
end
