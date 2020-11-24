FactoryBot.define do
  factory :order_address do
    postal_cord {'111-1111'}
    region_id   { 2 } 
    municipality{Faker::Address }
    house_number{Faker::Address}
    phone_number{11111111111}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
