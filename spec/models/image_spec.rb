require 'rails_helper'

RSpec.describe Image, :type => :model do
  context "adding field_ids values and saving" do
    before do
      @image = Image.create
      @image.field_ids << 5
      @image.save
    end

    it 'creates a new version object', :versioning => true do
      expect(@image.versions.count).to eq(2)
    end

    it "when retrieving the image from the database" do
      id = @image.id
      expect(Image.find(id).field_ids).to eq([5])
    end
  end
end
