FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { '大阪府' }
    house_number { '1-1-1' }
    building_name { '101号室' }
    phone_number { '00000000000' }
    token { 'qawsderftgyhujikolp' }
  end
end