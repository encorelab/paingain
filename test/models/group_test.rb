require 'test_helper'

class GroupTest < ActiveSupport::TestCase
 def test_fixture_validity
    Group.all.each do |group|
      assert group.valid?
    end
  end

  def test_validations
    group = Group.create
    assert group.errors.messages[:name].present?
    assert_equal 1, group.errors.messages.length
  end

  def test_user
    group = groups(:default)
    assert group.users.first.present?
    assert group.users.first.id.present?
    assert group.users.first.first_name.present?
    assert group.users.first.last_name.present?
  end
end
