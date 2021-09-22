require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントを投稿できるとき' do
      it '全ての入力が存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントを投稿できないとき' do
      it 'comment_textが空では投稿できない' do
        @comment.comment_text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment text can't be blank")
      end
      it "user_idが空ではコメントできない" do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it "post_idが空では購入できない" do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Post must exist")
      end
    end
  end
end


