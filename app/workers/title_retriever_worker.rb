require 'htmlentities'

class TitleRetrieverWorker
    include Sidekiq::Worker
    include HTTParty

    def perform(id)
        url = Url.find(id) 
        response = HTTParty.get(url.original_url, timeout: 30)
        if response.to_s.match(/<title ?.*>(.*)<\/title>/)
          url.update(title: HTMLEntities.new.decode($1))
        else
          url.update(title: "Title not found!")
        end
    end
end