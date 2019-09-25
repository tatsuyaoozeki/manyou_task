FactoryBot.define do
  # factory :user do
  #   name { "ユーザーA" }
  #   email { "a@example.com" }
  #   password { "aaaaaa" }
  #   password_confirmation { "aaaaaa" }
  # end

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

  factory :label_user, class: User do
    name { "ラベルユーザー1" }
    email { "d@example.com" }
    password { "dddddd" }
    password_confirmation { "dddddd" }
  end

  factory :second_label_user, class: User do
    name { "ラベルユーザー2" }
    email { "e@example.com" }
    password { "eeeeee" }
    password_confirmation { "eeeeee" }
  end


end
