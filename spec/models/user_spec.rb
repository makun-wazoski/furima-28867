require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,first_name,family_name,kana_first_mame,kana_family_name,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password ="00000q"
        @user.password_confirmation ="00000q"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合であれば登録できる" do
        @user.password ="00000q"
        @user.password_confirmation ="00000q"
        expect(@user).to be_valid
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）なら登録できる" do
        @user.first_name ="漢字ひらカナ"
        expect(@user).to be_valid
        
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）なら登録できる" do
        @user.family_name ="漢字ひらカナ"
        expect(@user).to be_valid
      end
      it "kana_first_nameが全角（カタカナ）なら登録できる" do
        @user.kana_first_name ="タナカ"
        expect(@user).to be_valid
      end
      it "kana_family_nameが全角（カタカナ）なら登録できる" do
        @user.kana_family_name ="タナカ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank","Password can't be blank","Password Include both letters and numbers","Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password ="2w2w2"
        @user.password_confirmation = "2w2w2w"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "111111"  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name Full-width characters")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録でない" do
        @user.first_name = "aaaaaa"  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "famiry_nameが空では登録できない" do
        @user.family_name = ""  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name Full-width characters")
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = "aaaaaa"  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Full-width characters")
      end
      it "kana_first_nameが空では登録できない" do
        @user.kana_first_name = ""  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank", "Kana first name Full-width katakana characters")
      end
      it "kana_first_nameが全角（カタカナ）でなければ登録できない" do
        @user.kana_first_name = "aaaaaa"  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name Full-width katakana characters")
      end
      it "kana_family_nameが空では登録できない" do
        @user.kana_family_name = ""  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank", "Kana family name Full-width katakana characters")
      end
      it "kana_family_nameが全角（カタカナ）でなければ登録できない" do
        @user.kana_family_name = "aaaaaa"  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name Full-width katakana characters")
      end
      it "生年月日が空では登録できない。" do
        @user.birthday = ""  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end
end
