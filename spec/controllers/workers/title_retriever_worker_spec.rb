require 'rails_helper'

RSpec.describe TitleRetrieverWorker, type: :job do
    it "retrieve title for a url" do
        url = FactoryBot.create(:complete_url)
        Sidekiq::Testing.inline! do
            TitleRetrieverWorker.perform_async(url.id)
            expect(Url.last.title).to eq("Yahoo Brasil")
        end
    end
end
