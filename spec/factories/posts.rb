FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 20) }
    content { Faker::Lorem.characters(number: 200) }
    user
  end
end
