FactoryBot.define do
  factory :user do
    name              {'test'}
    email                 {Faker::Internet.email}
    password              {'aaa000'}
    password_confirmation {'aaa000'}
    firstname             {'漢字'}
    lastname              {'漢字'}
    firstname_katakana    {'カタカナ'}
    lastname_katakana     {'カタカナ'}
    birth_day             {"2000-01-01"}
  end
end
