class PhotosController < ApplicationController
  def index
    @photos = Photo.all

    render({ :template => "photos/index" })
  end

  def show
    path_id = params.fetch("path_id")
    @photo = Photo.where({ :id => path_id }).at(0)
    render({ :template => "photos/show" })
  end

  def update
    path_id = params.fetch("path_id")
    @update_photo = Photo.where({ :id => path_id }).at(0)
    @update_photo.image = params.fetch("input_image")
    @update_photo.caption = params.fetch("input_caption")

    if @update_photo.valid?
      @update_photo.save
      redirect_to("/photos/#{@update_photo.id}", { :notice => "Photo updated successfully." })
    else
      redirect_to("/photos/#{@update_photo.id}", { :notice => "Photo failed to update." })
    end
  end

  def destroy
    path_id = params.fetch("path_id")
    @delete_photo = Photo.find(path_id)
    @delete_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully." })
  end

end
