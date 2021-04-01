require 'rails_helper'

RSpec.describe Word, type: :model do
  #単一テストコード記入
  describe '#create' do
    before do
      @word = FactoryBot.build(:word)
    end

    context '新規投稿できるとき' do
      it 'titleとimage、note、genreが存在していれば投稿できること' do
        expect(@word).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it 'titleが空では投稿できない' do
        @word.title = ''
        @word.valid?
        expect(@word.errors.full_messages).to include("Title can't be blank") 
      end
      it 'imageが空では投稿できない' do
        @word.image = nil
        @word.valid?
        expect(@word.errors.full_messages).to include("Image can't be blank") 
      end
      it 'noteが空では投稿できない' do
        @word.note = ''
        @word.valid?
        expect(@word.errors.full_messages).to include("Note can't be blank") 
      end
      it 'genre_idが1では保存できない' do
        @word.genre_id = 1
        @word.valid?
        expect(@word.errors.full_messages).to include("Genre must be other than 1")
      end
      it 'userが紐付いていないと保存できないこと' do
        @word.user = nil
        @word.valid?
        expect(@word.errors.full_messages).to include('User must exist')
      end
    end
  end
end
