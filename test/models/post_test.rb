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
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
