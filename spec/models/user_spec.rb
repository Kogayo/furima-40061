require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '有効な情報が与えられた場合' do
    it 'すべての情報があれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context '無効な情報が与えられた場合' do
    it 'nicknameが空欄では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空欄では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空欄では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'birth_dayが空欄では登録できないこと' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    it 'first_nameが空欄では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空欄では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'read_firstが空欄では登録できないこと' do
      @user.read_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Read first can't be blank")
    end

    it 'read_lastが空欄では登録できないこと' do
      @user.read_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Read last can't be blank")
    end

    it 'passwordが6文字以上でなければ登録できないこと' do
      @user.password = 'pass1'
      @user.password_confirmation = 'pass1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが半角英数字混合でなければ登録できないこと' do
      @user.password = 'ｐａｓｓｗ１' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが英字のみでは登録できないこと' do
      @user.password = 'passwo' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '123456' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが一致しなければ登録できないこと' do
      @user.password_confirmation = 'differentpassword'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '名前に全角漢字ひらがなカタカナ以外が含まれていたら登録できないこと' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name First name is invalid. Input full-width characters")
    end

    it '名字に全角漢字ひらがなカタカナ以外が含まれていたら登録できないこと' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Last name is invalid. Input full-width characters")
    end
    
    it '名前に全角カタカナ以外が含まれていたら登録できないこと' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name First name is invalid. Input full-width characters")
    end

    it '名字に全角カタカナ以外が含まれていたら登録できないこと' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Last name is invalid. Input full-width characters")
    end
  end
end