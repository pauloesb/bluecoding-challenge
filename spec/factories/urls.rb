FactoryBot.define do
  factory :url do
    original_url { "http://www.google.com" }

    factory :complete_url do
      id { 1 }
      original_url { "http://yahoo.com" }
      short_url { "a" }
    end
  end
end
