require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '記事投稿' do
    context '記事を投稿できるとき' do
      it '全ての入力が存在すれば登録できる' do
        expect(@post).to be_valid
      end
    end
    context '記事を投稿できないとき' do
      it 'titleが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'lead_textが空では出品できない' do
        @post.lead_text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Lead text can't be blank")
      end
      it 'textが空では出品できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
      it 'imageが空では出品できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
