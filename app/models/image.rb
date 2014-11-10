class Image < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :picture
end
