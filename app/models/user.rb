# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  status        :integer          default("unverified"), not null
#  email         :citext           not null
#  password_hash :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE WHERE (status = ANY (ARRAY[1, 2]))
#
class User < ApplicationRecord
  include Rodauth::Rails.model
  enum :status, unverified: 1, verified: 2, closed: 3

  has_one :profile
  has_many :posts
  has_many :likes, dependent: :destroy

  def name
    profile.name
  end

  def avatar
    profile.avatar
  end

  def like(likeable)
    likes.create(likeable: likeable) unless liked?(likeable)
  end

  def unlike(likeable)
    likes.where(likeable: likeable).destroy_all if liked?(likeable)
  end

  def liked?(likeable)
    likes.exists?(likeable: likeable)
  end
end
