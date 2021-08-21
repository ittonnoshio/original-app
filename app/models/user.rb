class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'requires both letters and numbers.' }
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'is invalid. Input half-width characters.' }

  has_many :posts, dependent: :destroy
  # has_many :favorites, dependent: :destroy

  # has_many :relationships, dependent: :destroy
  # has_many :followings, through: :relationships, source: :follow
  # has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  # has_many :followers, through: :passive_relationships, source: :user

  # def follow(other_user)
  #   return if self == other_user

  #   # relationships.find_or_create_by!(follow_id: other_user)
  #   relationships.find_or_create_by!(follow_id: other_user.id)
  # end

  # def following?(user)
  #   followings.include?(user)
  # end

  # def unfollow(relathinoship_id)
  #   relationships.find(relathinoship_id).destroy!
  # end
end
