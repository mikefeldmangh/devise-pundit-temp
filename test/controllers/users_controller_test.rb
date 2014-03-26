require "test_helper"

class UsersControllerTest < ActionController::TestCase
	
	def setup
    @user = users(:regularuser)
    @admin = users(:admin)
    @admin.role = :admin
	end

  test "should get index page when authenticated as an admin" do
    sign_in @admin
    get :index
    assert_response :success
  end

  test "should redirect to login page when viewing index page whilst authenticated as a user" do
    sign_in @user
    get :index
    assert_response :redirect
  end

  test "should redirect to login page when viewing index page whilst not authenticated" do
    get :index
    assert_response :redirect
  end

  test "logged in should get show" do
    sign_in @user
    get :show, id: @user.id
    assert_response :success
  end
 
  test "not authenticated should get redirect" do
    get :show, id: @user.id
    assert_response :redirect
  end

end