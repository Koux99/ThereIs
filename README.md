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
私は雑学や海外ニュースを調べることが好きで、様々なWebサイトや、Twitter・Instagram等のSNSで検索を行います。
普段全く目を向けていなかった角度の情報は読んでいて楽しく、またたくさんの方にもぜひ知っていただきたいという思いになります。
多くの情報がネット上にある中で、個人の発信者が増えてきたことにより、情報が分散してしまっていることが私の感じた課題です。

・せっかくこれだけ面白い情報を発信しているサイトや個人がいるのに、そこまで辿り着くことが難しい
・情報の分散により、都度整理していくことが大変だと感じる様になった。

雑学・海外ニュースに限ったことではありますが、上記のようなことを感じながら、
せっかくこれだけ面白い雑学や海外ニュースがあるなら、自分がリソースになってひとまとめにしていきたい。
そう思う様になったのが今回このアプリを作成したきっかけになります。

ニュース記事ほど長くない文章なので、暇な時間にサクッと読んでいただき、
普段読む情報とは異なる角度の楽しさを知っていただければと思います。

アプリ名の「There is」は「There is no waste in our life」から取っています。
何か役に立つわけでもありませんが、

# 使用技術
## バックエンド
Ruby, Ruby on Rails

## フロントエンド
HTML, CSS, JavaScript

## データベース
MySQL, SequelPro

## インフラ (本番環境)
Heroku

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
