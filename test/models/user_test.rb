require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
		@user = User.create!(email: "craig@example.com", username: "Craig", password: "password")
		@user2 = User.create!(email: "test@example.com", username: "Test Man", password: "password")
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
		@user2.email = @user.email
		assert_not @user2.valid?
	end

	test "username cannot be empty" do
		@user.username = ""
		assert_not @user.valid?
	end

	test "username does not have to be unique" do
		@user2.username = @user.username
		assert @user.valid?
	end
end
