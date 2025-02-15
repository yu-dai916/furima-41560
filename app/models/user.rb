class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :firstname_katakana, presence: true
  validates :lastname_katakana, presence: true
  validates :birth_day, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_REGEX_ZENKAKU = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  PASSWORD_REGEX_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze

  validates :password,  format: { with: PASSWORD_REGEX }
  validates :firstname,  format: { with: PASSWORD_REGEX_ZENKAKU }
  validates :lastname, format: { with: PASSWORD_REGEX_ZENKAKU }
  validates :firstname_katakana, format: { with: PASSWORD_REGEX_KATAKANA }
  validates :lastname_katakana, format: { with: PASSWORD_REGEX_KATAKANA }

  belongs_to :item
end
