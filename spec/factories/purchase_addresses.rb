FactoryBot.define do
  factory :purchase_address do
    post_number { '123-4567'}
    shipping_area_id {  Faker::Number.between(from: 2, to: 48) }
    city { Gimei.city }
    house_number {Faker::Address.street_address}
    building { '東京ハイツ' }
    telephone { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    token {'1111111'}
    
  end
end
