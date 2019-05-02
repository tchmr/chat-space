FactoryBot.define do
  factory :user do
    password = Faker::Internet::password(8)
    name                   { Faker::Name::name }
    password               { password }
    password_confirmation  { password }
    email                  { Faker::Internet::free_email }
  end
end