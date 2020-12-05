FactoryBot.define do
  factory :item do
    name {Faker::Lorem.paragraph}
    info {Faker::Lorem.paragraph}
    category_id {Faker::Number.between(from: 2, to: 11)}
    status_id {Faker::Number.between(from: 2, to: 7)}
    shippingfee_id {Faker::Number.between(from: 2, to: 3)}
    shipplace_id {Faker::Number.between(from: 2, to: 48)}
    dateship_id {Faker::Number.between(from:2, to: 4)}
    price { Faker::Number.between(from:300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/rails1.png'), filename: 'rails1.png')  #画像は生成したインスタンス(itemモデル）に紐付いている必要がある->alterメソッドを利用
    end
  end
end