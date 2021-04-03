require 'rails_helper'

RSpec.describe Comment, type: :model do
  #単一テストコード記入
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end
    it 'textが存在していれば保存できる' do
      expect(@comment).to be_valid
    end
    it 'textが空では投稿できない' do
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Text can't be blank") 
    end
    it 'userが紐付いていないと保存できないこと' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('User must exist')
    end
    it 'wordが紐付いていないと保存できないこと' do
      @comment.word = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Word must exist')
    end
  end
end
