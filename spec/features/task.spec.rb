# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  
  background do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
  end
  scenario "タスク一覧のテスト" do
    visit tasks_path

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path

    fill_in 'タスク名', with: 'Factoryで作ったデフォルトのタイトル１'
    fill_in 'タスク詳細', with: 'Factoryで作ったデフォルトのコンテント１'

    click_on '登録する'

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end

  scenario "タスク詳細のテスト" do
    Task.create!(name: 'Factoryで作ったデフォルトのタイトル１', content: 'Factoryで作ったデフォルトのコンテント１', deadline: '2019.09.20.11.11')

    visit tasks_path
    page.first("#show").click

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'

  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do

  end

  scenario "タスクが終了期限の降順のテスト" do
    visit tasks_path
    click_on '終了期限でソート'

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
    # save_and_open_page
  end

  scenario "viewにてタスクが絞り込めるかのテスト" do
    visit tasks_path
    fill_in 'name', with: 'Factoryで作ったデフォルトのタイトル１'
    select '未着手'
    click_button 'search'

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content '未着手'
  end

  scenario "タスクが優先度の高い順に並び替えのテスト" do
    visit tasks_path(sort_priority: 'true')
    all('table td')[6].click_link '詳細を確認する'
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
    save_and_open_page
  end
end
