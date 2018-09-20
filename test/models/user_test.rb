require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not accept a password less than 7 characters" do
    user = User.new( 
      email: "test@test.com",
      password: "12345",
      password_confirmation: "12345"
    )
    assert_not user.save
  end

  test "should save a user if it meets the criteria" do
    user = User.new(
      email: "test@test.com",
      password: "12345678",
      password_confirmation: "12345678"
    )
    assert user.save
  end

  test "should not allow duplicate emails" do
    user = User.new(
      email: "test@test.com",
      password: "12345678",
      password_confirmation: "12345678"
    )
    assert user.save

    user2 = User.new(
      email: "test@test.com",
      password: "12345678",
      password_confirmation: "12345678"
    )
    assert_not user2.save
  end

  test "user should be authenticated" do
    user = User.new(
      email: "test@test.com",
      password: "12345678",
      password_confirmation: "12345678"
    )
    user.save
    assert user == User.authenticate_with_credentials(user.email, user.password)
  end

  test "users should not be authenticated with wrong password" do
    user = User.new(
      email: "test@test.com",
      password: "12345678",
      password_confirmation: "12345678"
    )
    user.save
    assert_not user == User.authenticate_with_credentials(user.email, "wrong password")
  end
end
