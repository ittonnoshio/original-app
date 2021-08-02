class Post < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :title
  end
  validates :category_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_one_attached :image

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
