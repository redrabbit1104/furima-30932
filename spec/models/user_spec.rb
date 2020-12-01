require 'rails_helper'
  
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do  #〜について記述する
    it "nicknameが空だと登録できない" do  #〜であるはず
      # user = FactoryBot.build(:user)
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      # user = User.new(nickname: "muramu", email: "", password: "000000aa", password_confirmation: "000000aa", last_name: "村田", first_name: "莉子", last_name_kana: "ムラタ", first_name_kana: "リコ", birthday: "1933-03-03")
      # user = FactoryBot.build(:user)
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@が含まれてないと登録できない" do
      @user.email = "233"
      @user.email.include?("@")
      @user.valid?
      expect(@user.errors.full_messages).to include("Email should include @")
    end

    it "emailが重複すると登録できない" do
      @existed_user = User.new(nickname: "muramu", email: "111@111", password: "000000aa", password_confirmation: "000000aa", last_name: "村田", first_name: "莉子", last_name_kana: "ムラタ", first_name_kana: "リコ", birthday: "1933-03-03")
      @user.email = "111@111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが空では登録できない" do
      # user = User.new(nickname: "muramu", email: "kkk@gmail.com", password: "", password_confirmation: "000000aa", last_name: "村田", first_name: "莉子", last_name_kana: "ムラタ", first_name_kana: "リコ", birthday: "1933-03-03")
      # user = FactoryBot.build(:user)
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordは5文字以下では登録できない" do
      @user.password = "11a11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角英数字混合でなければ登録できない" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordとpassword(confirmation)が一致しないと登録できない" do
      @user.password = "1111aa"
      @user.password_confirmation = "1111aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "password（confirmation)が空では登録できない" do
       @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it "名字（全角）が空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "名前（全角）が空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "名字カナ（全角）が空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "名字カナ（全角）が空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "生年月日が空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
