require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:regularuser)
    @admin = users(:admin)
    @admin.role = :admin
  end

  def teardown
    @user = nil
    @admin = nil
  end

  test "expect user to respond to name" do
    assert_respond_to @user, :name;
  end

  test "expect user with an empty name to be invalid" do
    @user.name = ""
    refute @user.valid?
  end

  test "admin user" do
    assert @admin.admin?
  end

  test "non-admin user" do
    refute @user.admin?
  end
end
