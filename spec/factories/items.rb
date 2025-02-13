FactoryBot.define do
  factory :item do
name { '太郎' }
price { 1000 }
explanation { '説明' }
category_id { 1 }
quality_id { 1 }
payment_id { 1 }
prefecture_id { 1 }
scheduled_delivery_id { 1 }
association :user 

after(:build) do |item|
  item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
  end
end