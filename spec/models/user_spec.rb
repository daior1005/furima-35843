require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = Factory.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが空だと登録できない' do
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性でないと登録できない' do
      @user.save
      another_user = Factory.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含まないと登録できない' do
      @user.email = 'kkkgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email does not contain @')
    end
    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Password can't be blank')
    end
    it 'パスワードは、6文字以上での入力が必須' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters')
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須' do
      @user.password = '000000'
      @user.password_confirmation = '000001'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password do not match')
    end
    it 'passwordの半角英語のみは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password should not be half-width English only')
    end
    it 'passwordの数字のみは登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password should not be numbers only")
    end

    it 'passwordの全角英数混合は登録できない' do
      @user.password = '000AAA'
      @user.password_confirmation = '000AAA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password should not be mixed with full-width alphanumeric characters")
    end

    it '誕生日が空の場合は登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Birth_date can't be blank')
    end

    it '姓が空の場合は登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name can't be blank")
    end
  
    it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.family_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name should be used full-width")
    end

    it '名：空の場合は登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end
    it '名：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.family_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name should be used full-width")
    end
    it '姓（フリガナ）が空の場合は登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name_kana can't be blank")
    end
    it '姓（フリガナ）が全角（カタカナ）以外は登録できない' do
      @user.family_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name_kana should be full-width kana only")
    end
    it '名（フリガナ）が空の場合は登録できない'
    @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name_kana can't be blank")
    end
    it '名（フリガナ）が全角（カタカナ）以外は登録できない' do
      @user.first_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Ffirst_name_kana should be full-width kana only")
    end
   end
 end
end
