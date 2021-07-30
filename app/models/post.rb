class Post < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :title
  end
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_one_attached :image
end
