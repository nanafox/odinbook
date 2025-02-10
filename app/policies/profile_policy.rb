class ProfilePolicy < ApplicationPolicy
  def read?
    true
  end

  def update?
    user.id == record.user_id
  end
end
