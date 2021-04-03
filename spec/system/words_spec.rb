require 'rails_helper'

RSpec.describe "新規投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @word = FactoryBot.build(:word)
    sleep 0.1
  end

  context '新規投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_selector('a') #new_wordパス確認(セレクタはしていすることができるのか？)
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
  context '新規投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit root_path
      expect(page).to have_no_selector('.fas')
    end
  end
end

RSpec.describe '投稿詳細', type: :system do
  before do
    @word = FactoryBot.create(:word)
  end
  it 'ログインしたユーザーは投稿詳細ページに遷移してコメント投稿欄が表示される' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: @word.user.email
    fill_in 'パスワード', with: @word.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_link "#{@word.title}", href: word_path(@word)
    visit word_path(@word)
    expect(page).to have_selector('img')
    expect(page).to have_content(@word.title)
    expect(page).to have_content(@word.note)
    expect(page).to have_selector 'form'
  end
  it 'ログインしていない状態で投稿詳細ページに遷移できるもののコメント投稿欄が表示されない' do
    visit root_path
    expect(page).to have_link "#{@word.title}", href: word_path(@word)
    visit word_path(@word)
    expect(page).to have_selector('img')
    expect(page).to have_content(@word.title)
    expect(page).to have_content(@word.note)
    expect(page).to have_no_selector('form')
  end
end

RSpec.describe '投稿編集', type: :system do
  before do
    @word1 = FactoryBot.create(:word)
    @word2 = FactoryBot.create(:word)
    sleep 0.1
  end
  context 'ツイート編集ができるとき' do
    it 'ログインしたユーザーは自分の投稿を編集ができる' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @word1.user.email
      fill_in 'パスワード', with: @word1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      visit word_path(@word1)
      expect(page).to have_link '編集', href: edit_word_path(@word1)
      visit edit_word_path(@word1)
      expect(
        find("#word_genre_id").value
      ).to eq "#{@word1.genre_id}"
      expect(
        find("#word_title").value
      ).to eq @word1.title
      expect(
        find("#word_note").value
      ).to eq @word1.note
      image_path = Rails.root.join('public/images/word2_test_image.jpg')
      attach_file('word[image]', image_path, make_visible: true)
      find("option[value='#{@word1.genre_id}']").select_option
      fill_in 'word[title]', with: "#{@word1.title}+編集したタイトル"
      fill_in 'word[note]', with: "#{@word1.note}+編集したテキスト"
      expect{
        find('input[name="commit"]').click
      }.to change { Word.count }.by(0)
      expect(current_path).to eq(word_path(@word1))
      expect(page).to have_selector('img')
      expect(page).to have_content("#{@word1.title}+編集したタイトル")
      expect(page).to have_content("#{@word1.note}+編集したテキスト")
    end
  end
  context '投稿編集ができないとき' do
    it 'ログインしたユーザーは自分以外の投稿の編集画面には遷移できない' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @word1.user.email
      fill_in 'パスワード', with: @word1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      visit word_path(@word2)
      expect(page).to have_no_link '編集', href: edit_word_path(@word2)
    end
    it 'ログインしていないと投稿の編集画面には遷移できない' do
      visit word_path(@word1)
      expect(page).to have_no_link '編集', href: edit_word_path(@word1)
      visit word_path(@word2)
      expect(page).to have_no_link '編集', href: edit_word_path(@word2)
    end
  end
end

RSpec.describe '投稿削除', type: :system do
  before do
    @word1 = FactoryBot.create(:word)
    @word2 = FactoryBot.create(:word)
  end
  context '投稿削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿した投稿の削除ができる' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @word1.user.email
      fill_in 'パスワード', with: @word1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      visit word_path(@word1)
      expect(page).to have_link '削除', href: word_path(@word1)
      expect{
        find_link('削除', href: word_path(@word1)).click
      }.to change { Word.count }.by(-1)
      expect(current_path).to eq(root_path) 
      #img[src="#{@word.image}"]は記述を改善したいかも
      expect(page).to have_no_selector('img[src="#{@word.image}"]')
      expect(page).to have_no_content("#{@word1.title}")
      expect(page).to have_no_content("#{@word1.note}")
    end
  end
  context 'ツイート削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの削除ができない' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @word1.user.email
      fill_in 'パスワード', with: @word1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      visit word_path(@word2)
      expect(page).to have_no_link '削除', href: edit_word_path(@word2)
    end
    it 'ログインしていないとツイートの削除ボタンがない' do
      visit word_path(@word1)
      expect(page).to have_no_link '削除', href: edit_word_path(@word1)
      visit word_path(@word2)
      expect(page).to have_no_link '削除', href: edit_word_path(@word2)
    end
  end
end