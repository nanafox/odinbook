class ProfilesController < ApplicationController
  skip_before_action :ensure_profile_complete, only: [ :new, :create ]

  before_action :authenticate
  before_action :set_profile, only: [ :show, :edit, :update ]

  def new
    @profile = Profile.new
    authorize! @profile
  end

  def create
    @profile = Profile.new(profile_params)
    authorize! @profile

    if @profile.save
      redirect_to root_path, notice: "Welcome, your profile is complete"
    else
      flash.now[:alert] = "Profile update failed"
      render :new, status: :unprocessable_content
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to current_user_profile_path,
                  notice: "Profile updated successfully"
    else
      flash.now[:alert] = "Failed to update profile"
      render :edit, status: :unprocessable_content
    end
  end

  def me
    @profile = current_user.profile
  end

  private

    def profile_params
      params.expect(profile: [ :name, :username, :bio, :avatar ])
            .merge({ user: current_user })
    end

    def set_profile
      @profile = Profile.find_by(username: params[:username])
      authorize! @profile
    end
end
