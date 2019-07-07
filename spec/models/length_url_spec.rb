require 'rails_helper'

RSpec.describe LengthUrl, type: :model do
    before :each do 
        FactoryBot.create(:length_url)
    end

    it "return a size using static method" do
        expect(LengthUrl.size).to eq(0)
    end

    it "increase size by one" do
        expect(LengthUrl.increase).to be_truthy
        expect(LengthUrl.size).to eq(1)
    end
end