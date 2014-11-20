class ImagesController < ApplicationController
  before_action :find_image

  def index
    
  end

  def show
  end

  def edit
    @field = Field.new
    @versions = @image.versions
  end

  def update
    @gallery = @image.gallery
    @field = Field.where(field_params).first_or_create
    @image.field_ids << @field.id
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
