# Handles the landing page routes
class LandingPageController < ApplicationController
  skip_before_action :ensure_profile_complete

  def index
  end
end
