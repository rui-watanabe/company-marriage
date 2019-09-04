require 'rails_helper'

feature 'tweet', type: :feature do
  let(:user) { create(:user) }

  scenario 'post tweet' do
    visit root_path
    expect(page).to have_no_content('SEND')

    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_profile', with: user.profile
    fill_in 'user_avatar', with: user.avatar
    fill_in 'user_name', with: user.name
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('投稿する')

    expect {
      click_link('SEND')
      expect(current_path).to eq new_tweet_path
      fill_in 'text', with: 'フィーチャスペックのテスト'
      find('input[type="submit"]').click
    }.to change(Tweet, :count).by(1)
  end
end