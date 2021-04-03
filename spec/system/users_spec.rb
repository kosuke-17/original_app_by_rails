require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'ニックネーム', with: @user.nickname
      fill_in '名前', with: @user.name
      fill_in 'フリガナ', with: @user.name_kana
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード(6文字以上)', with: @user.password
      fill_in 'パスワード再入力', with: @user.password_confirmation
      fill_in 'プロフィール', with: @user.profile
      find("option[value='#{@user.job_id}']").select_option
      image_path = Rails.root.join('public/images/user_test_image.jpg')
      attach_file('user[user_image]', image_path, make_visible: true)
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'ニックネーム', with: ''
      fill_in '名前', with: ''
      fill_in 'フリガナ', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード(6文字以上)', with: ''
      fill_in 'パスワード再入力', with: ''
      fill_in 'プロフィール', with: ''
      image_path = Rails.root.join('public/images/user_test_image.jpg')
      attach_file('user[user_image]', image_path, make_visible: true)
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq user_registration_path
    end
  end
end
RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      find( 'input[name="commit"]').click
      expect(current_path).to eq(new_user_session_path)
    end
  end
end