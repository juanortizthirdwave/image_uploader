require 'rails_helper'

RSpec.describe PaperTrail::Version, :type => :model do
  context "testing different versions" do
    before do
      @image = Image.create
      @image.fields.merge! city: "Chicago"
      @image.save
    end

    it 'creates a new version object', :versioning => true do
      expect(@image.versions.count).to eq(2)
    end

    it 'returns the updated field_ids' do
      expect(@image.fields).to eq(city: "Chicago")
    end

    context 'checking different versions' do
      before do
        @image.fields.merge! author: "Juan"
        @image.save
        @old_image = @image.previous_version
      end

      it 'creates another version of the object', :versioning => true do
        expect(@image.versions.count).to eq(3)
      end

      it 'checking previous version gives the right value ', :versioning => true do
        expect(@old_image.fields).to eq({ city: "Chicago", author: "Juan" })
      end
    end
  end
end
