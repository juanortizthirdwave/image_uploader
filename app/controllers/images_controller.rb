class ImagesController < ApplicationController
  before_action :find_image

  def index
    
  end

  def show
    p @image.reload.fields
  end

  def edit
    @versions = @image.versions
  end

  def update
    @gallery = @image.gallery
    field = {field_params[:name].to_sym => field_params[:value]}
    @image.fields.merge! field
    @image.save
    redirect_to gallery_image_path @gallery, @image
  end

  private

  def find_image
    @image = Image.find(params[:id])
  end

  def field_params
    params.require(:image).fetch(:field).permit(:name, :value)
  end
end
