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
class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :name, :username, :bio, presence: true
  validates :username, uniqueness: true
  validates :user_id, uniqueness: { message: "profile exists already" }

  def to_param
    username
  end
end
