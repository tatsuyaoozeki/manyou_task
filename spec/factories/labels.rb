FactoryBot.define do
  factory :label, class: Label do
    name { "ラベル１" }
  end
  
  factory :second_label, class: Label do
    name { "ラベル2" }
  end
end
