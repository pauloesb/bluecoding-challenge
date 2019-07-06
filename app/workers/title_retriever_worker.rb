class TitleRetrieverWorker
    include Sidekiq::Worker
    include HTTParty

    def perform(id)
        url = Url.find(id) 
        response = HTTParty.get(url.original_url)
        if response.to_s.match(/<title ?.*>(.*)<\/title>/)
          url.update(title: $1)
        else
          url.update(title: "Title not found!")
        end
    end
end