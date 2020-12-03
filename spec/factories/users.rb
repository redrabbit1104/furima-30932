FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    last_name              { '村井' }
    first_name             { '秀樹' }
    last_name_kana         { 'ムライ' }
    first_name_kana        { 'ヒデキ' }
    birthday               { '1999-03-03' }
  end
end
