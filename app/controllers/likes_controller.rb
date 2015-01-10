class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create
    render json: {new_like_count: @review.likes.count}
  end

end
