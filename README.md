# アプリ名
There is (ゼアイズ)

# 概要
 - ブログ投稿サイト
    - ジャンル
      - 雑学(メイン)
      - 海外ニュース
      - 海外エンタメ
      - etc...


# 本番環境
- https://there-is.herokuapp.com/

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


# 制作背景
私は雑学や海外ニュースを調べることが好きで、様々なWebサイトやSNSを使って検索を行います。
普段全く目を向けていなかった角度の情報は読んでいて楽しく、たくさんの方に知っていただきたいという思いになります。
そんな中、雑学や海外ニュースを調べることが好きな自分なりに課題を感じていました。

- Webサイト/SNS等、発信者が増えたからこそ、情報が埋もれてしまう
- 個の良質なサイトがたくさんあるが、そこまで辿り着けない
- 情報の分散により、整理が難しい

せっかくこれだけ面白い情報を発信しているサイトや個人がいるのに、埋もれてしまっていることがとても悔しい気持ちになりました。
それなら、自分がリソースになってひとまとめにしていこう！！・・・・という思いから今回このアプリを作成しました。

ジャンルは限られますが、これまで調べてきたたくさんの情報をこのサイトにてご紹介し、
皆さんと一緒に、視野をもっともっと広げて行けたらと思い、日々楽しく情報を集めています！！

ニュース記事ほど長くない文章なので、暇な時間にサクッと読んでいただき、
普段読む情報とは異なる角度の楽しさを知っていただけたら幸いです。

アプリ名の「There is」は「There is no waste in our life」から取っています。
埋もれてしまっている情報が多い時代ですが「無駄なものはない」というところから、この名前をつけました。

# DEMO
## ①トップページ
[![Image from Gyazo](https://i.gyazo.com/45eca7b97bd1e849788e14cdf30f398b.gif)](https://gyazo.com/45eca7b97bd1e849788e14cdf30f398b)

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
[![Image from Gyazo](https://i.gyazo.com/1a6c6e2bad3e4fa119506d7064db2a55.gif)](https://gyazo.com/1a6c6e2bad3e4fa119506d7064db2a55)

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
- いいね機能を実装することで、自分の好みの記事を好きな時に一覧で確認できる様にした
- 見た目をスッキリさせたい、1つ1つの記事に注目していただきたい点から、ページング機能を実装し、表示する記事数を6件に絞った
- ブログは管理者が必要なので、usersテーブルにadminというカラムをboolean型で用意し、デフォルト値をfalseとした。管理者アカウントのカラムのみtrueとし、adminを条件式としたif文を用いてビューの表示制限を行った



# 使用技術
## バックエンド
Ruby, Ruby on Rails

## フロントエンド
HTML, CSS, JavaScript

## データベース
MySQL, SequelPro

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
