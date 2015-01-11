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
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path
    else @photo.delete
      flash[:notice] = 'Error! Photo has already been created'
      redirect_to photos_path
    end
  end

  def show
    redirect_to photos_path
  end

  def edit
    @photo = current_user.photos.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'You cannot edit this - please try again!'
    redirect_to photos_path
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to photos_path
  end

  def destroy
    @photo = current_user.photos.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to photo_path
    rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'You cannot delete this!'
    redirect_to photos_path
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :image)
    end
  
end
