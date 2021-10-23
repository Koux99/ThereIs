require 'rails_helper'

RSpec.describe '新規記事投稿', type: :system do
  before do
    @admin  = FactoryBot.create(:user)
    @user = FactoryBot.build(:user)
    @user.admin = 0
    @user.save
    @post  = FactoryBot.create(:post)
  end
  context '新規記事投稿ができるとき'do
    it 'ログインした「管理者」は新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email',    with: @admin.email
      fill_in 'Password', with: @admin.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('Post')
      # 投稿ページに移動する
      visit new_post_path
      # フォームに情報を入力する
      fill_in 'Title', with: @post.title 
      fill_in 'About', with: @post.lead_text 
      fill_in 'post[text]',  with: @post.text 
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('post[image]', image_path)
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Post.count }.by(1)
      # 投稿が完了したらトップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど投稿した「画像」が存在することを確認する
      expect(page).to have_selector('img')
      # トップページには先ほど投稿した「タイトル」が存在することを確認する
      expect(page).to have_content(@post.title)
      # トップページには先ほど投稿した「概要」が存在することを確認する
      expect(page).to have_content(@post.lead_text)
    end
  end
  context '新規記事投稿ができないとき'do
    it '「管理者」でログインしていないと新規投稿ページに遷移できない' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email',    with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('Post')
    end
  end
end

RSpec.describe '記事編集', type: :system do
  before do
    @admin  = FactoryBot.create(:user)
    @user   = FactoryBot.build(:user)
    @user.admin = 0
    @user.save
    @post   = FactoryBot.create(:post)
  end
  context '記事編集ができるとき' do
    it 'ログインした「管理者」は自分が投稿した記事の編集ができる' do
      # 記事を投稿したユーザー(管理者)でログインする
      visit new_user_session_path
      fill_in 'Email',    with: @admin.email
      fill_in 'Password', with: @admin.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 記事の詳細ページへ遷移する
      visit post_path(@post)
      # 「編集」へのリンクがあることを確認する
      expect(page).to have_link 'Edit', href: edit_post_path(@post)
      # 編集ページへ遷移する
      visit edit_post_path(@post)
      # すでに投稿済みの内容がフォームに入っていることを確認する (画像は除く)
      expect(
        find('#post_title').value
      ).to eq(@post.title)
      expect(
        find('#post_lead_text').value
      ).to eq(@post.lead_text)
      expect(
        find('#post_text').value
      ).to eq(@post.text)
      # 投稿内容を編集する
      fill_in 'Title', with: "#{@post.title} + あああああ" 
      fill_in 'About', with: "#{@post.lead_text} + あああああ" 
      fill_in 'post[text]',  with: "#{@post.text} + あああああ" 
      # 編集してもPostモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Post.count }.by(0)
      # 編集が完了すると記事の詳細ページに遷移することを確認する
      expect(current_path).to eq(post_path(@post))
      # 詳細ページには先ほど変更した内容の「タイトル」が存在することを確認する（Title）
      expect(page).to have_content("#{@post.title} + あああああ")
      # 詳細ページには先ほど変更した内容の「テキスト」が存在することを確認する (Text）
      expect(page).to have_content("#{@post.text} + あああああ")
      # トップページに遷移する
      visit root_path
      # トップページには先ほど変更した内容の「概要」が存在することを確認する   （About）
      expect(page).to have_content("#{@post.lead_text} + あああああ")
    end
  end
  context '記事編集ができないとき' do
    it 'ログインしていても「管理者」以外は記事の編集画面には遷移できない' do
      # 管理者ではないユーザーでログインする
      visit new_user_session_path
      fill_in 'Email',    with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 投稿記事の詳細ページに遷移する
      visit post_path(@post)
      # 「編集」へのリンクがないことを確認する
      expect(page).to have_no_link 'Edit', href: edit_post_path(@post)
    end
    it 'ログインしていないとツイートの編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      #記事の詳細ページに遷移する
      visit post_path(@post)
      # 記事に「編集」へのリンクがないことを確認する
      expect(page).to have_no_link 'Edit', href: edit_post_path(@post)
    end
  end
end

RSpec.describe '投稿削除', type: :system do
  before do
    @admin  = FactoryBot.create(:user)
    @user   = FactoryBot.build(:user)
    @user.admin = 0
    @user.save
    @post   = FactoryBot.create(:post)
  end
  context 'ツイート削除ができるとき' do
    it 'ログインした「管理者」は自らが投稿した記事の削除ができる' do
      # 記事を投稿したユーザー(管理者)でログインする
      visit new_user_session_path
      fill_in 'Email', with: @admin.email
      fill_in 'Password', with: @admin.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 記事の詳細ページへ遷移する
      visit post_path(@post)
      # 「削除」へのリンクがあることを確認する
      expect(page).to have_link 'Edit', href: edit_post_path(@post)
      # 投稿を削除するとレコードの数が1減ることを確認する
      expect{
        find_link('Delete', href: post_path(@post)).click
      }.to change { Post.count }.by(-1)
      # 削除が完了するとトップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページには削除した記事の「画像」が存在しないことを確認する
      expect(page).to have_no_content(@post.image)
      # トップページには削除した記事の「タイトル」が存在しないことを確認する
      expect(page).to have_no_content(@post.title)
      # トップページには削除した記事の「概要」が存在しないことを確認する
      expect(page).to have_no_content(@post.lead_text)
    end
  end
  context 'ツイート削除ができないとき' do
    it 'ログインしていても「管理者」以外は記事の削除ができない' do
      # 管理者ではないユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 記事の詳細ページへ遷移する
      visit post_path(@post)
      # 詳細ページに「削除」へのリンクがないことを確認する
      expect(page).to have_no_link 'Delete', href: post_path(@post)
    end
    it 'ログインしていないとツイートの削除ボタンがない' do
      # トップページに移動する
      visit root_path
      # 記事の詳細ページへ遷移する
      visit post_path(@post)
      # 詳細ページに「削除」へのリンクがないことを確認する
      expect(page).to have_no_link 'Delete', href: post_path(@post)
    end
  end
end
