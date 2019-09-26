# 「FactoryBotを使用します」という記述
FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    name { 'Factoryで作ったデフォルトのタイトル１' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
    deadline { '2019.09.20 22:47'}
    status { "yet" }
    priority { "high" }
    user_id {1}
    user
  end

  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    name { 'Factoryで作ったデフォルトのタイトル２' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
    deadline { '2019.09.20 19:47'}
    status { "working" }
    priority { "medium" }
    user_id {2}
    user
  end

  factory :third_task, class: Task do
    name { 'Factoryで作ったデフォルトのタイトル２' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
    deadline { '2019.09.20 19:47'}
    status { "completed" }
    priority { "low" }
    user_id {3}
    user
  end

  factory :label_task, class: Task do
    name { 'ラベルユーザー１' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
    deadline { '2019.09.20 19:47'}
    status { "completed" }
    priority { "low" }
    user_id {1}
  end

  factory :second_label_task, class: Task do
    name { 'ラベルユーザー２' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
    deadline { '2019.09.20 19:47'}
    status { "completed" }
    priority { "low" }
    user_id {2}
  end



end
