# Policy for the profile actions
class ProfilePolicy < ApplicationPolicy
  def new?
    user.profile.new_record?
  end

  def create?
    new?
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
