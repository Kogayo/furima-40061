require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(
      nickname: 'TestUser',
      email: 'test@example.com',
      password: 'password1',
      password_confirmation: 'password1',
      birth_day: '2000-01-01',
      first_name: '太郎',
      last_name: '山田',
      read_first: 'タロウ',
      read_last: 'ヤマダ'
    )
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であること' do
      @user.password = 'pass1'
      @user.password_confirmation = 'pass1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが半角英数字混合であること' do
      @user.password = 'pass123' 
        @user.valid?
        expect(@user.errors.full_messages).not_to include("Password must include both letters and numbers")
     end

    it 'passwordとpassword_confirmationが一致すること' do
      @user.password_confirmation = 'differentpassword'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'birth_dayが空では登録できないこと' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'read_firstが空では登録できないこと' do
      @user.read_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Read first can't be blank")
    end

    it 'read_lastが空では登録できないこと' do
      @user.read_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Read last can't be blank")
    end

    it 'お名前(全角)は、全角（漢字）での入力が必須であること' do
      @user.first_name = '太郎'
      @user.last_name = '山田'
      @user.valid?
      expect(@user.errors.full_messages).not_to include("First name is invalid", "Last name is invalid")
    end
    
    it 'お名前(全角)は、全角（ひらがな）での入力が必須であること' do
      @user.first_name = 'たろう'
      @user.last_name = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).not_to include("First name is invalid", "Last name is invalid")
    end
    
    it 'お名前(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.first_name = 'タロウ'
      @user.last_name = 'ヤマダ'
      @user.valid?
      expect(@user.errors.full_messages).not_to include("First name is invalid", "Last name is invalid")
    end
  end
end