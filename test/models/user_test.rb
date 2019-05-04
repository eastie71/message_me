require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
		@user = User.create!(email: "craig@example.com", password: "password")
		@user2 = User.create!(email: "test@example.com", password: "password")
	end

	test "user should be valid" do
		assert @user.valid?
	end

	test "email cannot be blank" do
		@user.email = ""
		assert_not @user.valid?
	end

	test "email must be valid" do
		@user.email = "fred@email"
		assert_not @user.valid?
	end

	test "complicated email should be valid user" do
		@user.email = "fred.rrr.eee.333@abc.vic.gov.edu.au.co"
		assert @user.valid?
	end

	test "user must be unique" do
		@user2.email = "craig@example.com"
		assert_not @user2.valid?
	end
end
