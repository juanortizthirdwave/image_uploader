require 'rails_helper'

RSpec.describe Image, :type => :model do
  context "adding field_ids values and saving" do
    before do
      @image = Image.create
      @image.fields.merge! city: "Chicago"
      @image.save
    end

    it "when retrieving the image from the database" do
      id = @image.id
      expect(Image.find(id).fields[:city]).to eq("Chicago")
    end
  end
end
