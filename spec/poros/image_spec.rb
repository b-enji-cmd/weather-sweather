require 'rails_helper'

RSpec.describe Image do
  before :all do
    @image_data = { 
      url: "https://example.com",
      photographer: "test"
     }
     @actual = Image.new(@image_data, "Denver")
  end

  describe "attributes" do
    it "should exist" do
     
       expect(@actual.class).to eq Image
       expect(@actual).to respond_to(:location)
       expect(@actual).to respond_to(:image_url)
       expect(@actual).to respond_to(:credit)
    end
  end

  describe "instance methods" do
    it "#set_credit" do
      expect(@actual.set_credit(@image_data).class).to eq Hash
      expect(@actual.set_credit(@image_data).keys).to eq([:source, :author, :logo])
      expect(@actual.set_credit(@image_data)[:author]).to eq "test"
    end
  end
end
