FactoryBot.define do
  factory :purchase_address do
    token {'tokq2w3e4r5t6y7u8i9o0p'}
    postal_code           { '111-1111' }
    prefecture_id            { 2 }
    city        { Faker::Address.city }
    house_number          { Faker::Address.street_address}
    building { Faker::Address.secondary_address }
    phone_number   { 9099990000 }
  end
end
