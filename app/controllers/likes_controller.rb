class LikesController < ApplicationController
  before_action :authenticate
  before_action :set_likeable

  def toggle
    if current_user.liked?(@likeable)
      current_user.unlike(@likeable)
      @liked = false
    else
      current_user.like(@likeable)
      @liked = true
    end

    respond_to do |format|
      format.turbo_stream
      format.json {
        render json: { liked: @liked, likes_count: @likeable.likes_count }
      }
    end
  end

  private

    def set_likeable
      @likeable = params[:likeable_type].constantize.find(params[:likeable_id])
    end
end
