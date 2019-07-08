class Url < ApplicationRecord
    include UrlConcerns
    validates_uniqueness_of :shortgs_url
    validates :original_url, presence: true
    validates_format_of :original_url,
        with: /\A(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})\z/
    scope :top_100, -> { order(access: :desc, title: :asc, original_url: :asc).limit(100) }
end