# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  background do
    @user = FactoryBot.create(:user)
    FactoryBot.create(:task, user_id: @user.id)
    FactoryBot.create(:second_task, user_id: @user.id)
    FactoryBot.create(:third_task, user_id: @user.id)
  end

  def logged_test
    visit new_session_path
    fill_in 'session[email]', with: 'a@example.com'
    fill_in 'session[password]', with: 'aaaaaa'
    click_button 'Log in'
  end


  scenario "タスク一覧のテスト" do
    logged_test
    visit tasks_path

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end

  scenario "タスク作成のテスト" do
    logged_test
    visit new_task_path

    fill_in 'タスク名', with: 'Factoryで作ったデフォルトのタイトル１'
    fill_in 'タスク詳細', with: 'Factoryで作ったデフォルトのコンテント１'

    click_on '登録する'

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
  end

  scenario "タスク詳細のテスト" do
    logged_test
    # Task.create!(name: 'Factoryで作ったデフォルトのタイトル１', content: 'Factoryで作ったデフォルトのコンテント１', deadline: '2019.09.20.11.11')

    visit tasks_path
    page.first("#show").click

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'

  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    logged_test

  end

  scenario "タスクが終了期限の降順のテスト" do
    logged_test
    visit tasks_path
    click_on '終了期限でソート'

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
    # save_and_open_page
  end

  scenario "viewにてタスクが絞り込めるかのテスト" do
    logged_test
    visit tasks_path
    fill_in 'name', with: 'Factoryで作ったデフォルトのタイトル１'
    select '未着手'
    click_button 'search'

    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content '未着手'
  end

  scenario "タスクが優先度の高い順に並び替えのテスト" do
    logged_test
    visit tasks_path(sort_priority: 'true')
    all('table td')[6].click_link '詳細を確認する'
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
    save_and_open_page
  end

end
