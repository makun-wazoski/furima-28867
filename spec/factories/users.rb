FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"11111q"}
    password_confirmation {password}
    first_name            {"晋三"}
    family_name           {"安倍"}
    kana_first_name       {"シンゾウ"}
    kana_family_name      {"アベ"} 
    birthday              {Faker::Date.birthday}   
  end
end