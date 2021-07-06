require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = Furima.build(:user)
  end


  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(nickname: '', email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須' do
      user = User.new(nickname: 'abe', email: '', password: '00000000', password_confirmation: '00000000')
      user.valid?
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
      @user.password = '00000'
      @user.password_confirmation = '00001'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password do not match)')
    end
  end
end
