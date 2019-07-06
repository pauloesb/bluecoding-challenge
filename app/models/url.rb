class Url < ApplicationRecord
    validates :original_url, presence: true

    before_create :generate_short_url

    def generate_short_url
        self.short_url = "#{self.object_id}"
    end
end