require 'rails_helper'

RSpec.describe "アウトプット投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @word = FactoryBot.build(:word)
    sleep 0.1
  end

  context 'アウトプット投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_selector('.fas') #new_wordパス確認(iconのfasというセレクタ指定)
      visit new_word_path
      image_path = Rails.root.join('public/images/word_test_image.jpg')
      attach_file('word[image]', image_path, make_visible: true)
      find("option[value='#{@word.genre_id}']").select_option
      fill_in 'word[title]', with: @word.title
      fill_in 'word[note]', with: @word.note
      expect{
      find('input[name="commit"]').click
    }.to change { Word.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_selector('img')
      expect(page).to have_content(@word.title)
      expect(page).to have_content(@word.note)
    end
  end
  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit root_path
      expect(page).to have_no_selector('.fas')
    end
  end
end
