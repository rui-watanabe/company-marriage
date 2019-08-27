FactoryBot.define do

  factory :user do
    name                  {"田中太郎"}
    password              {"123456"}
    password_confirmation {"123456"}
    profile               {"第一営業所属"}
    sequence(:email) {Faker::Internet.email}
    avatar                {"IMG_1969.JPG"}
  end
end
