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
  end
end
