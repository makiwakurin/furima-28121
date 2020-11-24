class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday
  end
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'ユーザー本名のフリガナは全角（カタカナ）で入力してください' }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: '半角英数字混合で入力して下さい' }
end
