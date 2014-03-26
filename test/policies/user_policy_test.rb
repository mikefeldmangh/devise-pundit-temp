require 'test_helper'

class UserPolicyTest < Minitest::Unit::Test

	def setup
    @user = users(:regularuser)
    @admin = users(:admin)
    @admin.role = :admin
  end

	def test_index
		policy = UserPolicy.new @admin, nil
		assert policy.index?
	end

	def test_update
		
	end

	def test_destroy
		
	end
	
end
