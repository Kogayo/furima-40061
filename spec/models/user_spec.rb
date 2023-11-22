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
    it '必須項目が空欄では登録できないこと' do
      @user.nickname = ''
      @user.email = ''
      @user.password = ''
      @user.birth_day = ''
      @user.first_name = ''
      @user.last_name = ''
      @user.read_first = ''
      @user.read_last = ''
      expect(@user).to_not be_valid
    end

    it 'passwordが6文字以上でなければ登録できないこと' do
      @user.password = 'pass1'
      @user.password_confirmation = 'pass1'
      expect(@user).to_not be_valid
    end

    it 'passwordが半角英数字混合でなければ登録できないこと' do
      @user.password = 'pass123' 
      expect(@user).to_not be_valid
    end

    it 'passwordとpassword_confirmationが一致しなければ登録できないこと' do
      @user.password_confirmation = 'differentpassword'
      expect(@user).to_not be_valid
    end

    it '名前に全角漢字以外が含まれていたら登録できないこと' do
      @user.first_name = 'たろう'
      expect(@user).to_not be_valid
    end

    it '名字に全角漢字以外が含まれていたら登録できないこと' do
      @user.last_name = 'やまだ'
      expect(@user).to_not be_valid
    end
    
    it '名前に全角ひらがなが含まれていたら登録できないこと' do
      @user.first_name = 'タロウ'
      expect(@user).to_not be_valid
    end

    it '名字に全角ひらがなが含まれていたら登録できないこと' do
      @user.last_name = 'ヤマダ'
      expect(@user).to_not be_valid
    end
    
    it '名前に全角カタカナ以外が含まれていたら登録できないこと' do
      @user.first_name = 'たろう'
      expect(@user).to_not be_valid
    end

    it '名字に全角カタカナ以外が含まれていたら登録できないこと' do
      @user.last_name = 'やまだ'
      expect(@user).to_not be_valid
    end
  end
end