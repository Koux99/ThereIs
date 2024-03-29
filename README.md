# アプリ名
There is 

# 概要
 - ブログ投稿サイト
    - ジャンル
      - 雑学(メイン)
      - 海外ニュース
      - 海外エンタメ


# 本番環境
- URL
  ~~http://35.73.104.210/~~
現在デプロイは行っておらず、以前AWSにデプロイしていた際の情報。


- ID/Pass
   - ID: admin
   - Pass: 0909

- ログイン情報(テスト用)
   - 管理者用 (新規投稿機能・投稿編集機能・投稿削除機能を使用可能)
     - メールアドレス: admin@test
     - パスワード: admin1234t
   - 閲覧者用 (閲覧用)
     - メールアドレス: viewer@test
     - パスワード:    viewer1234t

- GitHub リポジトリ
  https://github.com/Koux99/ThereIs



# DEMO
## ①トップページ　(一覧表示機能)
![cc26c7f2a04c6fbd1b2596650172eea6](https://user-images.githubusercontent.com/88068042/139200417-f1dbccdb-ef75-440d-8e8f-74a6c8b3465c.gif)

- 全てのユーザーは、投稿された記事の一覧が確認できる
- 「いいね」はログインユーザーのみ確認できる
- 右下に固定されているPOSTボタンは管理者ログイン時のみ表示される

## ②投稿ページ　(新規投稿機能)
[![Image from Gyazo](https://i.gyazo.com/065570f92abeff692a4fcd1fc7419d13.gif)](https://gyazo.com/065570f92abeff692a4fcd1fc7419d13)

- 管理者のみ、トップページの右下に固定されているPOSTボタンより、新規投稿を行うことができる
- タイトル/概要/テキスト/画像を全て入力・添付することで投稿ができる
- 投稿された記事はトップページの投稿一覧に表示される

## ③投稿詳細ページ (投稿詳細表示機能)
[![Image from Gyazo](https://i.gyazo.com/aa94f719ac756ea215d3c22191d11000.gif)](https://gyazo.com/aa94f719ac756ea215d3c22191d11000)

- 投稿した記事のタイトル/いいね数/画像/テキスト/コメント欄を確認することができる 
- いいね数・コメント欄は、ログインユーザーのみ確認可能

## ④編集ページ (投稿編集機能)
[![Image from Gyazo](https://i.gyazo.com/b96ccd19489cae1782b3cddcf2100a3b.gif)](https://gyazo.com/b96ccd19489cae1782b3cddcf2100a3b)

- 管理者のみ、詳細ページの記事タイトル下部に「Edit」ボタンが表示され、押下することで編集ページへ遷移する
- 後編集内容を保存することで記事が編集され、該当記事の詳細ページへ遷移する

## ⑤投稿削除機能
![1a6c6e2bad3e4fa119506d7064db2a55](https://user-images.githubusercontent.com/88068042/139200501-ecf0b844-7272-467c-b323-710b69842319.gif)
- 管理者のみ、詳細ページの記事タイトル下部に「Delete」ボタンが表示され、押下することで記事が削除される
- 記事を削除後、トップページに遷移する


## ⑥コメント欄 (コメント機能)
[![Image from Gyazo](https://i.gyazo.com/ed950fa5075477d9fe1bf1d8c395ee5c.gif)](https://gyazo.com/ed950fa5075477d9fe1bf1d8c395ee5c)

- ログインユーザーのみコメントすることが可能
- 各記事にて投稿されたコメントは一覧で確認でき、コメント内容・ユーザー名・投稿日を確認することができる


## ⑦いいね機能
[![Image from Gyazo](https://i.gyazo.com/e5c2e7a055f4034acec644a0685025fc.gif)](https://gyazo.com/e5c2e7a055f4034acec644a0685025fc)

- ログインユーザーは記事に「いいね」することができる
- ヘッダー「Likes」ボタンより、自分が「いいね」した記事が一覧で表示されるページに遷移できる



# 工夫した点
- いいね機能を実装することで、自分の好みの記事を好きな時に一覧で確認できるようにした
- 見た目をスッキリさせたい・1つ1つの記事に注目していただきたい点から、ページング機能を実装し、表示する記事数を6件に絞った
- ブログは管理者が必要なので、usersテーブルにadminというカラムをboolean型で用意し、デフォルト値をfalseとした。管理者アカウントのカラムのみtrueとし、adminを条件式としたif文を用いてビューの表示制限を行った



# 使用技術
## バックエンド
Ruby, Ruby on Rails

## フロントエンド
HTML, CSS, JavaScript

## データベース
MariaDB, SequelPro

## インフラ
AWS(EC2), Capistrano

## Webサーバ 
Nginx

## アプリケーションサーバ
Unicorn

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode


# DB設計

## users テーブル

| Column             | Type    | Options                     |
| ------------------ | ------  | --------------------------- |
| email              | string  | null: false, unique: true   |
| password           | string  | null: false                 |
| nickname           | string  | null: false, unique: true   |
| admin              | boolean | null: false, default: false |

### Association
- has_many :posts
- has_many :comments
- has_many :likes


## posts テーブル

| Column         | Type       | Options             |
| -------------- | ---------- | ------------------- |
| title          | text       | null: false         |
| lead_text      | text       | null: false         |
| text           | text       | null: false         |
| user_id        | references | foreign_key: true   |


### Association
- belongs_to :user
- has_many   :comments
- has_many   :likes


## comments テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| comment_text  | text       | null: false       |
| post_id       | references | foreign_key: true |
| user_id       | references | foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user


## likes テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| post_id        | references | foreign_key: true |
| user_id        | references | foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user
