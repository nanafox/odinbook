# Policy for the profile actions
class ProfilePolicy < ApplicationPolicy
  def new?
    user.profile.nil?
  end

  def create?
    record.new_record?
  end

  def show?
    true
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end
end
