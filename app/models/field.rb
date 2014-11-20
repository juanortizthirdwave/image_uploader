class Field < ActiveRecord::Base
  belongs_to :image
  has_paper_trail

  # after_update :update_image
  after_save :update_image


  private

  def update_image
    self.image.touch_with_version
  end
end
