FactoryGirl.define do
  factory :user do
    password  Faker::Internet.password(10, 20)
    password_confirmation { |u| u.password } 
    email     Faker::Internet.email
    username  Faker::Internet.user_name
  end
end
