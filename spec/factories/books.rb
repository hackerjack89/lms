FactoryBot.define do
  factory :book do
    name { Faker::Books::CultureSeries.book }
    author { Faker::Book.author }
    association :library
  end
end
