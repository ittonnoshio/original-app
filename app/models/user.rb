class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'requires both letters and numbers.' }
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'is invalid. Input half-width characters.' }

  has_many :posts
  has_many :favorites
end
