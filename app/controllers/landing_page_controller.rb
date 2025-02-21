# Handles the landing page routes
class LandingPageController < ApplicationController
  skip_before_action :ensure_profile_complete

  before_action :redirect_to_home, if: :current_user

  def index
  end

  private

    def redirect_to_home
      redirect_to current_user_profile_path
    end
end
