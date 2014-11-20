class Image < ActiveRecord::Base
  cattr_accessor(:field_ids) { Array.new }
  belongs_to :gallery
  has_paper_trail
  serialize :field_ids, Array
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :picture 

  def fields
    return self.field_ids if self.field_ids.empty?
    self.field_ids.map { |e| Field.find e }
  end
end
