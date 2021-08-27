class Post < ApplicationRecord
  with_options presence: true do
    validates :images
    validates :title
  end
  validates :category_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_many_attached :images
  has_many :favorites, dependent: :destroy

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  def already_favorited?(user)
      favorites.where(user_id: user.id).exists?
  end
end
