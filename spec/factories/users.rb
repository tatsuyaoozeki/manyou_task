FactoryBot.define do
  factory :user do
    name { "ユーザーA" }
    email { "a@example.com" }
    password { "aaaaaa" }
    password_confirmation { "aaaaaa" }
  end
end
