FactoryBot.define do
  factory :library do
    name { Faker::Educator.campus + ' Library' }
    address { Faker::Address.full_address }
  end
end
