# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  author_id  :bigint           not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :likes, as: :likeable, dependent: :destroy

  validates :content, presence: true

  def likes_count
    likes.count
  end

  def liked_by?(user)
    likes.exists?(user: user)
  end
end
