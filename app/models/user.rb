class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :purchases

  validates :nickname, :password, :first_name, :family_name, :first_name_kana, :family_name_kana,
  :birth_date presence: true
end
