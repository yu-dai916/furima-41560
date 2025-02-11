require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmationとfirstnameとlastnameとfirstname_katakanaとlastname_katakanaとbirth_dayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordが6文字以上であれば登録できる' do
      @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが同じなら登録できる' do
      @user.password = @user.password_confirmation
      expect(@user).to be_valid
    end
  end
    context '新規登録できない時' do
      it 'nameが空では登録できない' do
          @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'emailが空では登録できない' do
          @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていなければ登録できない' do
          @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
          @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aaa00'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordに半角英字がなければ登録できない' do
          @user.password = '000000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordに半角数字がなければ登録できない' do
          @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordに全角があると登録できない' do
        @user.password = 'aaaaaA'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password = 'test00'
          @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
          @user.password = 'aaa000'
          @user.password_confirmation = 'aab000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'firstnameが存在しなければ登録できない' do
          @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'lastnameが存在しなければ登録できない' do
          @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'firstname_katakanaが存在しなければ登録できない' do
          @user.firstname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
      end
      it 'lastname_katakanaが存在しなければ登録できない' do
          @user.lastname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana can't be blank")
      end
      it 'firstnameが全角入力でなければ登録できない' do
          @user.firstname = 'zenkaku'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end
      it 'lastnameが全角入力でなければ登録できない' do
          @user.lastname = 'zenkaku'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end
      it 'firstname_katakanaが全角カタカナ入力でなければ登録できない' do
          @user.firstname_katakana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname katakana is invalid')
      end
      it 'lastname_katakanaが全角カタカナ入力でなければ登録できない' do
          @user.lastname_katakana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname katakana is invalid')
      end
      it 'birth_dayが存在しなければ登録できない' do
          @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end