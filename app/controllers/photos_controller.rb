class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @post.user_id = current_user.id
    if @photo.save
      redirect_to photos_path
    else @photo.delete
      flash[:notice] = 'Error! Photo has already been created'
      redirect_to photos_path
    end

  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to '/photos'
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted'
    redirect_to '/photos'
  end

  private
    def photo_params
      params.require(:photo).permit(:name)
    end
  
end
