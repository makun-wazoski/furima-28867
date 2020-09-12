FactoryBot.define do
  factory :item do
    image           { '1A8BE703-8F27-44EA-BF8A-12E0BB1AB236_4_5005_c.jpeg' }
    item            { 'aaa' }
    text            { 'aaa' }
    cotegory_id        { 1 }
    status_id          { 1 }
    shipping_burden_id { 2 }
    shipping_erea_id   { 1 }
    date_shipment_id   { 2 }
    price { 10_000 }
    association :user
  end
end
