FactoryBot.define do
  factory :item_order do
    token { 'tok_abcdefghijk00000000000000000' }
    zip_code { '123-4567' }
    shipplace_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Nation.capital_city }
    blocknum { Faker::Lorem.words }
    building { Faker::Lorem.words }
    tel { Faker::Number.between(from: 1, to: 11) }
    user_id { Faker::Number.between(from: 1, to: 99) }
    item_id { Faker::Number.between(from: 1, to: 99) }
  end
end
