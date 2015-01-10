class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    like = @photo.likes.new
    like.user_id = current_user.id
    render json: { new_like_count: @photo.likes.count } if like.save
  end

end
