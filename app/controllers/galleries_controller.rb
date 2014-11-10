class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
    @image = Image.new
  end

  def update
    @gallery = Gallery.find(params[:id])
    @image = Image.new(image_params)
    @image.save!
    @gallery.images << @image
    redirect_to @gallery
  end

  private

  def image_params
    params.require(:image).permit(:picture)
  end
end
