# Share_app version _1.0.0_

## アプリケーション概要

### 初めに
サッカーが上手な選手は自分のプレーを言語化する能力に長けています。
テレビ朝日で放送されていたあるスポーツ番組のコーナーに試合終了後に選手が自分の得点シーンを解説するコーナーがあり、視聴者に自分の意図したプレーをわかりやすく説明をすることで選手にも視聴者にも好評のコーナーでした。
そこで今回はサッカーに関して自身のプレーを振り返り、言語化をするためのアウトプットプラットフォームを作成しようと考えました。



### 目的
このアプリを作る目的を3つに設定しました。 

### 目的1 「現代版サッカー日誌としてサッカー選手に活用してもらう」

今でもサッカー日誌をノートに書いている子はいると思います。
しかし、子供たちはノートに書いたり、書き間違えたら消し直したりと、書く内容を考える時間よりもノートに綺麗に書くことに時間が奪われてしまっています。
奪われている時間をなくし、自分と向き合う時間を増やすことでサッカーについて考える時間を増やします。
そしてプレーの成功、失敗を経験として曖昧に記憶するのではなく、写真と自分の言葉で自身の記録として振り返られるようにすることが目的です。

### 目的2 「自分の現状の技術レベルを把握して、次の練習の課題を見つける」

一つ一つの自分のプレーを振り返ることで、足りない基礎の技術ややりたいプレーを文字に起こすことで客観的に自分のレベルを可視化することができます。
そうすると、自分が上手くなるための課題を見つけやすくなり個人練習の成果を格段にあげる事ができます。

### 目的3 「プレーを言語化しつづけることで、試合中に的確な判断をできるようにする」

サッカーは一瞬一瞬の場面で論理的思考能力を使い自分でプレーの選択をしています。
「認知→理解→計画→動作→認知→・・・」のように無意識に一瞬で論理的思考能力を働かせています。
11人それぞれが論理的思考を働かせているので試合中に指示をしたり、ハーフタイムに選手同士で話し合います。
つまりプレーを言語化して伝えることは試合に勝つために、成果をあげるために必要になってきます。普段から論理的思考を使うことで、試合中に的確な判断をする事ができるようになることを目的としています。


# 使用言語・技術
 - HTML
 - CSS
 - Ruby
 - Ruby on Rails
 - Javascript
 - SQL
 - Git
 - Github

# 目指した課題解決

10年前の自分のようなサッカー漬けの日々を過ごしている
10代20代の若者が論理思考能力を継続して高めることで
サッカー選手としてだけでなく、人間力の向上2つ投げる事ができる。

# 洗い出した要件
 - 考えを言語化してアウトプット(投稿機能) 
 - 他者の考えや視点を学びたい(ユーザー管理機能・検索機能) 
 - 言語化した考えを記録しておきたい(投稿・編集機能)
 - 考えを共有したい(コメント機能)

## アプリ紹介


## 1トップ画面
|ログイン前|ログイン後|
|---|---|
|![before_sign_in](https://user-images.githubusercontent.com/79294818/113509879-d66a8100-9592-11eb-9292-a48cc3cf11b8.png)|![after_signed_in](https://user-images.githubusercontent.com/79294818/113509944-1e89a380-9593-11eb-96a1-c1fba7f6c583.png)|

### 利用方法
 - アクセスするとトップページに遷移
 - サイドバーの「新規登録」か「ログイン」をクリック
 - ログインページに遷移



## 2ユーザー登録・編集画面
|新規登録|編集|
|---|---|
|![user_sign_up](https://user-images.githubusercontent.com/79294818/113510170-783e9d80-9594-11eb-99b8-e5fa30725933.png)|![user_edit](https://user-images.githubusercontent.com/79294818/113510688-f8660280-9596-11eb-9b9f-9de307c6b6c8.png)|

### 利用方法
 - サイドバーの「新規登録」をクリックするとユーザー登録ページに遷移
 - 情報を入力し、「登録」をクリックすると登録完了

 - サイドバーの「マイページ」をクリックするとマイページに遷移
 - 「編集」をクリックして編集ページに遷移
 - 情報を変更し、「編集」をクリックすると編集完了



## 3アウトプット新規投稿画面
|新規投稿|編集|
|---|---|
|![output_new](https://user-images.githubusercontent.com/79294818/113510206-b8058500-9594-11eb-84a8-ffed86e78a4e.png)|![output_edit](https://user-images.githubusercontent.com/79294818/113510791-690d1f00-9597-11eb-88b7-fca55d9697f4.png)|

### 利用方法
 - 「写真のアイコン」をクリックすると投稿ページへ遷移
 - 情報を入力して「投稿」をクリックすると投稿完了



## 4ユーザー画面
|ユーザー一覧|ユーザー詳細|
|---|---|
|![all_user](https://user-images.githubusercontent.com/79294818/113510251-f438e580-9594-11eb-91f1-f56d9913aa06.png)|![user_show](https://user-images.githubusercontent.com/79294818/113510333-4ed24180-9595-11eb-8a05-b87dc7249ef2.png)|

### 利用方法
 - サイドバーの「ユーザー一覧」をクリックするとユーザー一覧画面に遷移
 - ユーザーのニックネームをクリックするとユーザー詳細画面に遷移
 - 「家のアイコン」をクリックするとトップページに遷移



## 5投稿詳細画面
|投稿詳細(コメントなし)|投稿詳細(コメントあり)|
|---|---|
|![no_comment](https://user-images.githubusercontent.com/79294818/113510483-036c6300-9596-11eb-876e-c15d17a95116.png)|![comment](https://user-images.githubusercontent.com/79294818/113510550-6958ea80-9596-11eb-9c33-bb6cdab3e55f.png)|

### 利用方法
 - 投稿してある「タイトル名」をクリックすると投稿詳細ページに遷移
 - ログインしている場合のみコメントを入力して「送信」をクリックするとコメント完了



## 6ジャンル検索画面
|検索前|検索後|
|---|---|
|![before_genre_search](https://user-images.githubusercontent.com/79294818/113510935-30ba1080-9598-11eb-8a49-76f8c89d0a6d.png)|![after_genre_search](https://user-images.githubusercontent.com/79294818/113510957-44fe0d80-9598-11eb-9eb5-85ef859cd744.png)|

### 利用方法
 - サイトバーのジャンル検索の下にあるボックスでジャンル指定
 - ジャンル指定した後に「検索」をクリックすると検索ページに遷移




# README

## ユーザー管理機能
### users テーブル

| Colum                 | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| name                  | string  | null: false               |
| name_kana             | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| profile               | text    | null: false               |
| job_id                | integer | null: false               |

- has_many :words
- has_many :comments

## アウトプット投稿機能
### words テーブル

| colum       | Type                | Options           |
| ----------- | ------------------- | ----------------- |
| title       | string              | null: false       |
| note        | text                | null: false       |
| genre       | integer             | null: false       |
| user        | references          | foreign_key: true |

- belongs_to :user
- has_many   :comments

image...ActiveStorage で実装
※保存予定先:AWS(S3)


## コメント投稿機能
### comments テーブル

| Colum      | Type        | Options     | 
| ---------- | ----------- | ----------- |
| text       | string      | null: false |
| user       | references  |             |
| word       | references  |             |

- belongs_to :user
- belongs_to :word


#使用アイコン提供元

Icons made by <a href="https://fontawesome.com/icons?d=gallery&p=2" title="icons">All 7,865 Awesome Icons</a> from <a href="https://fontawesome.com/" title="fontawsome"> www.fontawsome.com</a>