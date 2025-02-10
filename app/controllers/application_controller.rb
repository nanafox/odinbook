class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :ensure_profile_complete, if: :current_user

  private

    def authenticate
      rodauth.require_account
    end

    def current_user
      rodauth.rails_account
    end

    def ensure_profile_complete
      if current_user.profile.nil?
        redirect_to new_profile_path
      end
    end

    helper_method :current_user
end
