# Base class for application policies
class ApplicationPolicy < ActionPolicy::Base
  private

    def owner?
      if record.respond_to?(:user_id)
        record.user_id == user.id
      elsif record.respond_to?(:author_id)
        record.author_id == user.id
      end
    end
end
