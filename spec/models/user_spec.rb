require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、password, first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        expect(@user).to be_valid
      end
      it "paswordが半角英数字混合であれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameとemail、password, first_name,last_name,first_name_kana,last_name_kana,birthdayが空だと登録できない" do
        @user.nickname = ""
        @user.email = ""
        @user.password =""
        @user.first_name= ""
        @user.last_name = ""
        @user.first_name_kana = ""
        @user.last_name_kana = ""
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages)
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end
end
# bundle exec rspec spec/models/user_spec.rb 