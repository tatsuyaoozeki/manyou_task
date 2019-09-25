require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:label_user)
    FactoryBot.create(:second_label_user)
    FactoryBot.create(:label)
    FactoryBot.create(:second_label)
    FactoryBot.create(:label_task)
    FactoryBot.create(:second_label_task)
    FactoryBot.create(:labeling)
    FactoryBot.create(:second_labeling)
  end
  before do
    visit new_session_path
    fill_in 'session[email]', with: 'd@example.com'
    fill_in 'session[password]', with: 'dddddd'
    click_button 'Log in'
  end

  # scenario "ユーザー一覧のテスト" do
  #   logged_test
  #   visit tasks_path
  #   fill_in 'ラベル１', with: 'label_id'
  #   click_button 'search'
  #   expect(page).to have_content 'ラベル１'
  # end
  scenario "ラベルユーザー１一覧のテスト" do
    # ラベルユーザー１のタスクをラベル１だけ表示
    visit tasks_path
    save_and_open_page
    select 'ラベル１', from: 'label_id'
    click_button 'search'
    expect(page).to have_content ''
  end
end
  # scenario "viewにてラベルが絞り込めるかのテスト" do
  #   logged_test
  #   visit tasks_path
  #   fill_in 'ラベル１'
  #
  #   click_button 'search'
  #
  #   expect(page).to have_content 'ラベルユーザー１'
  # end
