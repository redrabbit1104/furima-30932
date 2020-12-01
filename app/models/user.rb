class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :nickname, :birthday, presence: true
  validates :email, presence: true, uniqueness: true # モデルにもemailカラムに対する一意性制約を掛ける。これをしないと同じemailを登録した場合、エラーが出てしまう。
  # validates :email, presence: true,uniqueness: { case_sensitive: true }

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do # 英数字混合のパスワードを要求
    validates :password, confirmation: true, length: { minimum: 6 } # パスワードを6文字以上に制限、confirmation: trueにすることによってパスワードと再確認パスワードが一致しないとエラーメッセージが出せる。
    validates :password_confirmation, length: { minimum: 6 } # パスワードを6文字以上に制限
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/ } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end

  has_many :items
  has_many :orders
end
