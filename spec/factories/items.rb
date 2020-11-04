FactoryBot.define do
  factory :item do
    name                { Faker::Lorem.sentence }
    text                { Faker::Lorem.sentence }
    category_id         { 2 }
    status_id           { 2 }
    charge_id           { 2 }
    region_id           { 2 }
    days_to_ship_id     { 2 }
    price               { 1000 }
  end
end
