class Image < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  serialize :fields, Hash

  # this is for the demos app, check if you should uncomment this line or add a validation
  do_not_validate_attachment_file_type :picture 

  has_paper_trail #:skip => [:gallery_id, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at]

  def fields
    read_attribute(:fields) || {}
  end
end
