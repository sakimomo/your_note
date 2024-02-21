# README
# アプリケーション名 
「Your note」
 
# アプリケーション概要
購入品をシェアし、みんなの「ほしい」がみつかる！
 
# URL
 https://your-note-ffgy.onrender.com
 
# テスト用アカウント
・Basic認証パスワード：1129<br>
・Basic認証ID：saki<br>
・メールアドレス：aaa@aaaaa<br>
・パスワード：aaa111<br>
 
# 利用方法
## ユーザー管理
トップページのヘッダーメニューから新規登録orログインする

## 投稿機能
1.ログイン後、ヘッダーメニューの「New Post」ボタンから、投稿ページへ遷移<br>
2.投稿内容（画像、カテゴリー、ハッシュタグ、コンテント）を選択、入力し投稿する<br>
3.投稿詳細ページから、自身の投稿の編集・削除を行う<br>

## コメント機能
1.投稿詳細ページで、コメントを投稿する<br>

## フォロー機能
1.投稿詳細ページなどから、他のユーザーページに遷移<br>
2.「Follow」ボタンで他のユーザーをフォローする<br>
3.「Following」ボタンで他のユーザーのフォロー解除する<br>
4.ユーザーページから「Following list」と「Follower list」を確認できる<br>

## いいね機能
1.投稿詳細ページから、♡ボタンで他のユーザーの投稿にいいねをする<br>
2.もう一度押すといいねを解除できる<br>
3.いいねした投稿は、ユーザーページのwish listから閲覧できる<br>

## 投稿検索
1.ヘッダーメニューの「Search」ボタンから、検索ページへ遷移<br>
2.検索フォームでの入力内容と、投稿のコンテンツに合致するものがあれば表示される<br>

## ユーザ毎のマイページ
1.ユーザーの名前、プロフィールの表示<br>
2.「wish list」、「Following list」、「Follower list」ボタンから、それぞれ一覧を確認できる<br>
3.ユーザーの投稿一覧を、クローゼットとして確認できる<br>
4.犬の画像にホバーすると、撫でているように動くため遊べる<br>

# アプリケーションを作成した背景

 
# 洗い出した要件
https://docs.google.com/spreadsheets/d/1bHZZnpBK3rgcD9N2LXnRifG38PFmLfT-LYQd-NZd84g/edit?usp=sharing

# 実装した機能についての画像やGIFおよびその説明
　　実装機能について、それぞれどのような特徴があるのか列挙、GIF
  
# 実装予定の機能
 
# データベース設計
![draw.io Image](drawio_image.png)
 
# 画面遷移図
 
# 開発環境
　使用した言語、サービスの記載
 
# ローカルでの動作方法
　git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記載
 
# 工夫したポイント
　制作背景、使用技術、開発方法、タスク管理など、企業へPRしたいこと
 
# 改善点
　より改善するとしたらどこか、どのようにやるのか
 
# 制作時間

# テーブル設計

## usersテーブル
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |

- has_many :comments
- has_many :notes
- has_many :likes
- has_many :active_relationships
- has_many :followings
- has_many :passive_relationships
- has_many :followers

## commentsテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| note      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :note
- has_many :likes

## notesテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| content    | text       | null: false                    | 
| user       | references | null: false, foreign_key: true |
| genre_id   | integer    | null: false                    |
| tag_name   | text       | null: false                    | 

- belongs_to :genre
- belongs_to :user
- has_many :comments
- has_many :tags

## likesテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| note       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :note

## relationshipsテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| follower   | references | null: false, foreign_key: true |
| followee   | references | null: false, foreign_key: true |

- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"

# tagsテーブル
| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| name       | string | null: false, unique: true |

- has_many :notes
- has_many :note_tag_relations
