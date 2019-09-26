FactoryBot.define do
  factory :labeling, class: Labeling do
    task_id { 1 }
    label_id { 1 }
  end

  factory :second_labeling, class: Labeling do
    task_id { 2 }
    label_id { 2 }
  end
end
