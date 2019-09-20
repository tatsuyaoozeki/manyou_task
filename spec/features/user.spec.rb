require 'rails_helper'

RSpec.feature "ユーザー機能", type: :feature do
  background do
    FactoryBot.create(:user)
  end

  def logged_test
    visit new_session_path
    fill_in 'session[email]', with: 'a@example.com'
    fill_in 'session[password]', with: 'aaaaaa'
    click_on 'Log in'
  end

end
