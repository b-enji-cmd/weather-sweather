require "rails_helper"

RSpec.describe "Image Facade" do
  let!(:location) {"denver"}
  it "should digest a location to image" do
    VCR.use_cassette("image_facade_happy", :record => :new_episodes) do
      expect(ImageFacade.get_background(location).class).to eq Image
      expect(ImageFacade.get_background(location).location).to eq location
      expect(ImageFacade.get_background(location).credit.class).to eq Hash
      expect(ImageFacade.get_background(location).credit.keys).to eq ([:source, :author, :logo])
    end
  end
end