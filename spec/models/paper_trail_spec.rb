require 'rails_helper'

RSpec.describe PaperTrail::Version, :type => :model do
  context "testing different versions" do
    before do
      @image = Image.create
      @image.field_ids << 5
      @image.save
    end

    it 'creates a new version object', :versioning => true do
      expect(@image.versions.count).to eq(2)
      expect(@image.field_ids).to eq([5])
    end

    context 'checking different versions' do
      before do
        @image.field_ids << 7
        @image.save
        @old_image = @image.previous_version
      end

      it 'checking previous version gives the right value ', :versioning => true do
        expect(@old_image.field_ids).to eq([5, 7])
      end
    end
  end
end
