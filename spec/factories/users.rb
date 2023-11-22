FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_day             { Faker::Date.between(from: '1990-01-01', to: '2005-12-31') }
    first_name            { "太郎"}
    last_name             { "山田"}
    read_first            { "たろう"}
    read_last             { "やまだ"}
  end
end

