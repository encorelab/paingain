require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_fixture_validity
    User.all.each do |user|
      assert user.valid?
    end
  end

  def test_group
    user = users(:default)
    assert user.group.present?
  end

  def test_validations
    user = User.create
    assert user.errors.messages[:email].present?
    assert user.errors.messages[:password].present?
    assert user.errors.messages[:group].present?
    assert_equal 3, user.errors.messages.length
  end

  def test_auth_conditions
    user = users(:default)
    group_conditions = {login: user.group_name}
    email_conditions = {login: user.email}
    assert_equal user.id, User.find_first_by_auth_conditions(group_conditions).id
    assert_equal user.id, User.find_first_by_auth_conditions(email_conditions).id
    assert_nil User.find_first_by_auth_conditions(login: 'broken')
  end

end
