class Image < ActiveRecord::Base
  belongs_to :gallery
  serialize :field_ids, Array
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :picture 
  has_paper_trail

  def fields
    return field_ids if field_ids.empty?
    field_ids.map { |e| Field.find e }
  end
end
