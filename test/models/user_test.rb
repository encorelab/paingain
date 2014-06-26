require 'test_helper'
class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:default)
    @admin = users(:admin)
  end

  def test_fixture_validity
    User.all.each do |user|
      assert user.valid?
    end
  end

  def test_group
    assert @user.group.present?
    assert @user.role.present?
    assert @user.first_name.present?
    assert @user.last_name.present?
  end

  def test_admin
    assert_equal 'admin', @admin.role
    assert @admin.group.present?
    assert @admin.role.present?
  end

  def test_validations
    user = User.create
    assert user.errors.messages[:email].present?
    assert user.errors.messages[:password].present?
    assert user.errors.messages[:group].present?
    assert_equal 4, user.errors.messages.length
  end

  def test_auth_conditions
    # user = users(:default)
    email_conditions = {login: @user.email}
    assert_equal @user.id, User.find_first_by_auth_conditions(email_conditions).id
    assert_nil User.find_first_by_auth_conditions(login: 'broken')
  end
end
