require 'rails_helper'

RSpec.describe User, type: :model do
#単一テストコード記入
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できるとき' do
      it 'nicknameとname、name_kana、email、password、password_confirmation、job_id、user_imageが存在すれば登録できる' do
        expect(@user).to be_valid 
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'profileが空でも保存できる' do
        @user.profile = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'name_kanaが空では登録できない' do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end
      it 'nameが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'job_idが1では保存できない' do
        @user.job_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Job must be other than 1")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name 全角文字を使用してください")
      end
      it 'name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.name_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana 全角カナ文字を使用してください")
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = 'てすとてすと'
        @user.password_confirmation = 'てすとてすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
      end
      it 'emailは@が含まれていないと登録ができない' do
        @user.email = 'samplesample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end


    end
  end
end
