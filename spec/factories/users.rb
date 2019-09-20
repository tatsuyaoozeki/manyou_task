FactoryBot.define do
  factory :user do
    name { "ユーザーA" }
    email { "a@example.com" }
    password { "aaaaaa" }
    password_confirmation { "aaaaaa" }
  end

  factory :second_user, class: User do
    name { "ユーザーB" }
    email { "b@example.com" }
    password { "bbbbbb" }
    password_confirmation { "bbbbbb" }
  end

  factory :third_user, class: User do
    name { "ユーザーC" }
    email { "c@example.com" }
    password { "cccccc" }
    password_confirmation { "cccccc" }
  end

end
