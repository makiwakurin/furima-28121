require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、password, first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do

      #email関連のテスト

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages)
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      # password関連のテスト

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password英数字混合だが5文字以下であれば登録できない' do
        @user.password = 'aa000'
        @user.password_confirmation = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合で入力して下さい')
      end
      it 'パスワードが半角数字のみの時も登録できないこと' do
        @user.password = '11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合で入力して下さい')
      end

      # 名前関連のテスト

      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana ユーザー本名のフリガナは全角（カタカナ）で入力してください')
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana ユーザー本名のフリガナは全角（カタカナ）で入力してください')
      end
      it 'ユーザー本名(first_name)は、全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'ユーザー本名(last_name)は、全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'ユーザー本名(first_name_kana)は、全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.first_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana ユーザー本名のフリガナは全角（カタカナ）で入力してください')
      end
      it 'ユーザー本名(last_name_kana)は、全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.last_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana ユーザー本名のフリガナは全角（カタカナ）で入力してください')
      end

      # 誕生日関連のテスト
      
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
     
    end
  end
end
# bundle exec rspec spec/models/user_spec.rb
