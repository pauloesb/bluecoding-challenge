FactoryBot.define do
  factory :url do
    original_url { "http://www.google.com" }

    factory :complete_url do
      id { 1 }
      original_url { "http://yahoo.com" }
      short_url { "a" }
    end

    factory :empty_url do
      original_url { "" }
    end

    factory :wrong_url do
      original_url { "http://thisismysite" }
    end

    factory :dummy_url do
      original_url { "http://my.dummy.site.com" }
    end
  end
end
