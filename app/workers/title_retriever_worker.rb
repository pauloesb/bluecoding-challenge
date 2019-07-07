require 'htmlentities'

class TitleRetrieverWorker
    include Sidekiq::Worker
    include HTTParty
    sidekiq_options retry: 2

    def perform(short_url)
      begin
        url = Url.find_by_short_url(short_url)
        response = HTTParty.get(url.original_url, timeout: 30)
        if response.to_s.match(/<title?\s?.*>(.*)<\/title>/)
          url.update(title: parse_treatment($1))
        else
          url.update(title: "Title not found!")
        end
      rescue HTTParty::RedirectionTooDeep
        url.update(title: "Error - Too Many Redirections!")
      rescue Errno::ECONNREFUSED
        url.update(title: "Error - Site Unavailable!")
      end
    end

    private

    # Reason to use this enconding so the job doesn't get stuck on
    # reading non-utf characters
    def parse_treatment(parse)
      content = parse.b
      content.encode!('UTF-8', 'ISO-8859-1')
      content.encoding
      HTMLEntities.new.decode(content)
    end
end