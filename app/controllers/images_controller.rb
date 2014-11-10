class ImagesController < ApplicationController
  def update
    binding.pry
    @gallery = Gallery.find(params[id])
    @gallery.update_attributes(params[:gallery])
  end

  def index
  end
end
