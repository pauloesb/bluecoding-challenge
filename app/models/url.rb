class Url < ApplicationRecord
    include UrlConcerns
    validates :original_url, presence: true
    validates_format_of :original_url,
        with: /\A(?:(?:http(s)*):\/\/|\b(?:[a-z\d]+\.))(?:(?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))?\))+(?:\((?:[^\s()<>]+|(?:\(?:[^\s()<>]+\)))?\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))?\z/
end