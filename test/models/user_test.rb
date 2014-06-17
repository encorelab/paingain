require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_fixture_validity
    User.all.each do |user|
      assert user.valid?
    end
  end

  def test_unqiue_group_name
    user = users(:default)
    assert user.group_name.present?
    group_name = user.group_name
    new_user = User.create(email: 'group@test.com', group_name: group_name)
    assert !new_user.valid?
    assert new_user.errors.messages[:group_name].present?
  end

  def test_validations
    user = User.create
    assert user.errors.messages[:email].present?
    assert user.errors.messages[:password].present?
    assert user.errors.messages[:group_name].present?
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
