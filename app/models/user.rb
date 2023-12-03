class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_NAME_REGEX =/\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_READ_REGEX =/\A[ァ-ヶー]+\z/
  
  validates :nickname ,    presence: true
  validates :birth_day,    presence: true
  validates :password,                     format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Password is invalid. Include both letters and numbers" }
  validates :last_name,    presence: true, format: { with: VALID_NAME_REGEX, message: "Last name is invalid. Input full-width characters" }
  validates :first_name,   presence: true, format: { with: VALID_NAME_REGEX, message: "First name is invalid. Input full-width characters" }
  validates :read_last,    presence: true, format: { with: VALID_READ_REGEX, message: "Read last kana is invalid. Input full-width katakana characters" }
  validates :read_first,   presence: true, format: { with: VALID_READ_REGEX, message: "Read first  kana is invalid. Input full-width katakana characters" }

  has_many :orders
  
end
