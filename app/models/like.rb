# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  likeable_type :string
#  likeable_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_likes_on_likeable                 (likeable_type,likeable_id)
#  index_likes_on_user_id                  (user_id)
#  index_likes_on_user_id_and_likeable_id  (user_id,likeable_id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
end
