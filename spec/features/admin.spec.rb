require 'rails_helper'

RSpec.feature "管理者機能", type: :feature do
  background do
    FactoryBot.create(:user)
  end

  before do

    visit new_session_path


    fill_in 'session_email', with: 'test@test.com'
    fill_in 'session_password', with: 'aaaaaa'

    click_on 'Log in'

  end

  scenario "ユーザー一覧のテスト" do
    visit admin_users_path


    expect(page).to have_content 'ユーザーA'

  end

  scenario "ユーザー作成のテスト" do
    visit new_admin_user_path
    fill_in 'user_name', with: 'テストユーザー１'
    fill_in 'user_email', with: 'test1@test.com'
    fill_in 'user_password', with: 'aaaaaa'
    fill_in 'user_password_confirmation', with: 'aaaaaa'
    click_on 'Create user'

    expect(page).to have_text "テストユーザー１"
  end

  scenario "ユーザー詳細のテスト" do
    visit admin_users_path
    click_link 'ユーザーA'
    expect(page).to have_text 'ユーザーA'
  end

  scenario "ユーザー編集のテスト" do
    visit admin_users_path
    click_link '編集'
    fill_in 'user_name', with: 'テストユーザー１'
    fill_in 'user_email', with: 'test1@test.com'
    fill_in 'user_password', with: 'aaaaaa'
    fill_in 'user_password_confirmation', with: 'aaaaaa'
    click_on 'Create user'
    expect(page).to have_text "テストユーザー１"
  end

  scenario "ユーザー削除のテスト" do
    visit new_admin_user_path
    fill_in 'user_name', with: 'テストユーザー１'
    fill_in 'user_email', with: 'test1@test.com'
    fill_in 'user_password', with: 'aaaaaa'
    fill_in 'user_password_confirmation', with: 'aaaaaa'
    click_on 'Create user'
    expect(page).to have_text 'テストユーザー１'
    click_link '削除', match: :first
    save_and_open_page
    expect(page).to have_text 'ユーザーA'
  end
end
