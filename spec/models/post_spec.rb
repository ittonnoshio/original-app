require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '投稿できるとき' do
      it 'image, title, category_idが存在すれば投稿できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿できないとき' do
      it 'imageが空では投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end

      it 'category_idが「--」では投稿できない' do
        @post.category_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include('Category must be other than 1')
      end

      it 'userが紐付いていないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end
