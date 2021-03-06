class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    like = @photo.likes.new
    like.user_id = current_user.id
    WebsocketRails[:likes].trigger 'new', {id: @photo.id, new_like_count: @photo.likes.count }
    if like.save
      redirect_to photos_path
    else
      flash[:notice] = "You already liked this photo."
      redirect_to photos_path 
    end
  end
  # def create
  #   @photo = Photo.find params[:photo_id]
  #   @photo.likes.create

  #   WebsocketRails[:likes].trigger 'new', {id: @photo.id, new_like_count: @photo.likes.count}

  #   redirect_to photos_path
  # end

end
