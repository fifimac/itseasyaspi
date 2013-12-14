require 'test_helper'

class SkirtpatternsControllerTest < ActionController::TestCase
  setup do
    @skirtpattern = skirtpatterns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skirtpatterns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skirtpattern" do
    assert_difference('Skirtpattern.count') do
      post :create, skirtpattern: { canvas1: @skirtpattern.canvas1, canvas2: @skirtpattern.canvas2, canvas3: @skirtpattern.canvas3, inner_radius: @skirtpattern.inner_radius, length: @skirtpattern.length, makepattern: @skirtpattern.makepattern, outer_radius: @skirtpattern.outer_radius, skirt_type: @skirtpattern.skirt_type, unit: @skirtpattern.unit, user_id: @skirtpattern.user_id, waist: @skirtpattern.waist, waistbandLgth: @skirtpattern.waistbandLgth, waistbandWdth: @skirtpattern.waistbandWdth }
    end

    assert_redirected_to skirtpattern_path(assigns(:skirtpattern))
  end

  test "should show skirtpattern" do
    get :show, id: @skirtpattern
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skirtpattern
    assert_response :success
  end

  test "should update skirtpattern" do
    put :update, id: @skirtpattern, skirtpattern: { canvas1: @skirtpattern.canvas1, canvas2: @skirtpattern.canvas2, canvas3: @skirtpattern.canvas3, inner_radius: @skirtpattern.inner_radius, length: @skirtpattern.length, makepattern: @skirtpattern.makepattern, outer_radius: @skirtpattern.outer_radius, skirt_type: @skirtpattern.skirt_type, unit: @skirtpattern.unit, user_id: @skirtpattern.user_id, waist: @skirtpattern.waist, waistbandLgth: @skirtpattern.waistbandLgth, waistbandWdth: @skirtpattern.waistbandWdth }
    assert_redirected_to skirtpattern_path(assigns(:skirtpattern))
  end

  test "should destroy skirtpattern" do
    assert_difference('Skirtpattern.count', -1) do
      delete :destroy, id: @skirtpattern
    end

    assert_redirected_to skirtpatterns_path
  end
end
