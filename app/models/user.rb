class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :purchases

  validates :nickname,
            presence: true
  
  VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGIX }
  
  validates :first_name,
            format: { with: /\A[ぁ-んァ-ン一-龥]/ },
            presence: true
  validates :family_name,
            format: { with: /\A[ぁ-んァ-ン一-龥]/ },
            presence: true
  validates :first_name_kana,
            format: { with: /\A[ァ-ヶー－]+\z/ },
            presence: true
  validates :family_name_kana,
            format: { with: /\A[ァ-ヶー－]+\z/ },
            presence: true
  validates :birth_date,
            presence: true
end
