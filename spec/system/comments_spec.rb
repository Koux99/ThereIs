require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @user   = FactoryBot.build(:user)
    @user.admin = 0
    @user.save
    @post   = FactoryBot.create(:post)
    @comment = FactoryBot.create(:comment)
  end

  it 'ログインしたユーザーは記事詳細ページでコメント投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # 記事詳細ページに遷移する
    visit post_path(@post)
    # コメントフォームに情報を入力する
    fill_in 'comment[comment_text]', with: @comment.comment_text
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Comment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(post_path(@post))
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content(@comment.comment_text)
  end
end

