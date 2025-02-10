# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  name       :string
#  username   :string
#  bio        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_profiles_on_user_id   (user_id) UNIQUE
#  index_profiles_on_username  (username) UNIQUE
#

require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  test "should create a new profile for a user" do
    user = users(:one)

    assert user.profile == profiles(:one)
  end

  test "should fail when another profile creation is attempted for same user" do
    user = users(:one)

    assert_raises ActiveRecord::RecordInvalid do
      Profile.create!(user: user, name: "Manny Poo", bio: "Hello world")
    end
  end

  test "should allow profile details update" do
    user = users(:one)

    user.profile.update!(name: "John Kialan Doe")

    assert user.profile.name_previously_changed?
    assert user.profile.name == "John Kialan Doe"
  end
end
