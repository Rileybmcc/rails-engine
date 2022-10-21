FactoryBot.define do
  factory :item do
    name { Faker::Coffee.blend_name }
    discription { Faker::Coffee.notes}
    unit_price { Faker::Number.number(digits: 6)}
    merchant_id { Faker::Number.number(digits: 4) }
  end
end
