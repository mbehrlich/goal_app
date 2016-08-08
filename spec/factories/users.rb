FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    password "12345678"
  end
end
