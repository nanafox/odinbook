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
end
