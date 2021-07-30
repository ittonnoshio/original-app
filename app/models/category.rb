class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '教育' },
    { id: 3, name: '美容' },
    { id: 4, name: 'ファッション' },
    { id: 5, name: 'デザイン' },
    { id: 6, name: '本' },
    { id: 7, name: 'お金' },
    { id: 8, name: '食べ物' },
    { id: 9, name: 'ビジネス' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
