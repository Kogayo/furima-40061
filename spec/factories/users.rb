FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {"abcd12"}
    password_confirmation {password}
    birth_day             { Faker::Date.between(from: '1990-01-01', to: '2005-12-31') }
    first_name            { "太郎"}
    last_name             { "山田"}
    read_first            { "タロウ"}
    read_last             { "ヤマダ"}
  end
end

