class Image < ActiveRecord::Base
  belongs_to :gallery
  serialize :field_ids, Array

  # ********* image uploader **********
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :picture 

  # ********* versioning image ********
  has_paper_trail :skip => [:gallery_id, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at]

  def fields
    return field_ids if field_ids.empty?
    field_ids.map { |e| Field.find e }
  end
end
