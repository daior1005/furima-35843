require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = Furima.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user = User.new(nickname: '', email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      @user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須' do
      @user = User.new(nickname: 'abe', email: '', password: '00000000', password_confirmation: '00000000')
      @user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性' do
      @user.save
      another_user = Furima.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要' do
      @user.email = 'kkkgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email does not contain @')
    end
    it 'パスワードが必須' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須' do
      @user.password = '000000'
      @user.password_confirmation = '000001'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password do not match)')
    end
    it 'passwordの半角英語のみは登録できない' do
    end
    it 'passwordの数字のみは登録できない' do
    end
    it 'passwordの全角英数混合は登録できない' do
    end
    it '誕生日が空の場合は登録できない' do
    end
    it '姓が空の場合は登録できない' do
    end
  
姓：全角（漢字・ひらがな・カタカナ）以外は登録できない
名：空の場合は登録できない
名：全角（漢字・ひらがな・カタカナ）以外は登録できない
姓（フリガナ）：空の場合は登録できない
姓（フリガナ）：全角（カタカナ）以外は登録できない
名（フリガナ）：空の場合は登録できない
名（フリガナ）：全角（カタカナ）以外は登録できない
  end
end
