module UrlConcerns
    extend ActiveSupport::Concern

    included do
        before_create :generate_short_url
        before_create :normalize
        after_create :retrieve_title
    end

    private

    def generate_short_url
        length_url_instance = LengthUrl.first || LengthUrl.create!
        length_url_instance.update(size: length_url_instance.size+1) if Url.count > 62**length_url_instance.size
        size_url = length_url_instance.size
        chars = ['A'..'Z','a'..'z','0'..'9'].map{|x| x.to_a}.flatten
        self.short_url = size_url.times.map{chars.sample}.join
        Url.find_by_short_url(self.short_url) && (self.short_url = size_url.times.map{chars.sample}.join)
    end

    def retrieve_title
        TitleRetrieverWorker.perform_in(1.seconds, self.short_url)
    end

    def normalize
        self.original_url.strip!
        self.original_url = self.original_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
        self.original_url.slice!(-1) if self.original_url[-1] == "/"
        self.original_url = "http://#{self.original_url}"
    end
end