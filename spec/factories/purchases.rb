FactoryBot.define do
  factory :purchase do
    association :item
    association :user
    association :address
  end
end
