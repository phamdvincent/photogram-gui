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
end
