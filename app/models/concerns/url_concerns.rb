module UrlConcerns
    extend ActiveSupport::Concern

    included do
        before_create :generate_short_url
        before_create :normalize
        after_create :retrieve_title
    end

    private

    def generate_short_url
        self.short_url = "#{self.object_id}"
    end

    def retrieve_title
        TitleRetrieverWorker.perform_async(self.id)
    end

    def normalize
        self.original_url.strip!
        self.original_url = self.original_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
        self.original_url.slice!(-1) if self.original_url[-1] == "/"
        self.original_url = "http://#{self.original_url}"
    end
end