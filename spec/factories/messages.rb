FactoryBot.define do
  factory :message do
    body      { Faker::Lorem::sentence }
    image     { File.open("#{Rails.root}/public/uploads/message/image/3/1280x800x80ad296cf9ab6602219bbd3.jpg") }
    user
    group
  end
end