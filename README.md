# Company-Marriageについて
http://3.114.152.122/

<img width="927" alt="aaa26a93bef133bed8bbddcd7ea6c8dc" src="https://user-images.githubusercontent.com/52365507/64315010-cb80f080-cfeb-11e9-98dc-7eec98c68946.jpg">

# Company-Marriageの制作理由
・収益性がある
・カリキュラムの復習
・+αの機能がつけられる

## 収益性がある
・新規メディア立ち上げた企画力を活かせるWebアプリケーションを作りたかったので、収益性の見込みがあることにこだわりました。

### マッチングアプリの市場規模
・大手マッチングアプリタップルを運営しているサイバーエージェントの調査だと、国内で5年後には、現状の2倍の市場規模になる。
・日本のITの5年先にいるというアメリカでは、アメリカ科学アカデミーが100万人を対象にした研究結果で、既婚者の出会いのきっかけの3人に1人がオンラインであった。

### なぜ社内恋愛マッチングアプリなのか
・大手ウェンディング会社アニヴェルセルが既婚者対して実施したアンケートで、出会いのきっかけが職場と答えた割合が全体の25%で1位。
・「マッチングアプリ×会社内」というサービスが、今の国内のマッチング市場に存在しない。
→ 他のマッチングアプリとの差別化できる領域

### Company-Marriageの顧客像
・アットホームな雰囲気を会社説明で伝えている会社の人事担当者
・企業の福利厚生として取り入れてもらう

### Company-Marriage導入企業のメリット
・他社にはない福利厚生として会社説明会で差別化が測れる
→ 2017年に実施された大手人材会社キャリタスによる女子就活生意識調査でトップ10に、会社が社内結婚をどれくらいしているか気になる、というものが入っていました
・急成長している会社が社内恋愛を推奨している
→ ZOZOなどを運営しているスタートトゥデイでは、社内恋愛・社内結婚が推奨されている
・長寿企業には社内結婚が多い
→ 日経BPコンサルティングの調査で、100年企業は5年未満の企業に比べて社内結婚する割合が8倍多いというデータ

## カリキュラムの復習
・カリキュラムでユーザー管理機能、投稿機能、コメント機能などを実装したので、その復習ができるWebアプリケーションを作りたいと思いました。

## +αの機能がつけられる
・カリキュラムで学習した機能以外で、マッチングアプリサービスに必要な機能を実装した。
→ フォロー（マッチング）機能、ダイレクトメール機能、公開・非公開設定。


# Company-Marriageで工夫したところ
・ネックであった他SNS、他マッチングアプリとの差別化をはかるために、気になる・あなたを気になるの数をユーザー自身にしか見れない状態にしました
→ FaceBookのように職場の関係上、友達申請を承諾しなければいけないというようにならないため、ユーザーがこのアプリを使っているのか、使っていないのかは気になるボタンを押した人にしかわからないという仕様にした
・カリキュラムにはなかったフォロー（マッチング）機能、ダイレクトメール機能、enumによる公開・非公開設定を実装した


# Company-Marriageの機能
・投稿機能、コメント機能

## 投稿機能
・ヘッダーの投稿するボタンから投稿ができます
・自分が投稿したものに対して、編集・削除が行えます

## コメント機能
・投稿に対して、非同期通信でコメントができます

## フォロー（マッチング）機能
・ユーザー一覧ページから気になった人に対して、気になるボタンを押せます。
・ユーザーマイページから、気なるボタンを押した人・押された人の一覧を確認することができます

## ダイレクトメール機能
・互いに気になるボタンを押したら、気になる人の詳細ページにチャットへのボタンが押せるようになり、個人同士の非同期通信でやりとりできます

## 公開・非公開設定
・ユーザーマイページから、公開・非公開設定が行え、非公開にした場合はユーザー一覧に表示されなくなる

## テスト
・rspec,capybaraによるテストを実装


# 今後実装したいこと
・動的なwebサービスするため、JavaScript（jQuery）を多用する
・ユーザー一覧に異性だけを表示させる
・レスポンシブルデザインへの対応
・マッチングが成立した時、コメントされた時、メッセージが来た時の通知機能
・Active Storageで複数画像選択をできるようにする

# Company-MarriageのDB設計

## Users table
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|integer|null: false|
|profile|string|null: false|
|avatar|string|null: false|

### Association
- has_one_attached :avatar
- acts_as_followable
- acts_as_follower  
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy


## Rooms table
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user|references|null: false, foreign_key: true|
|entry|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy


## Entries table
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user|references|null: false, foreign_key: true|
|room|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :room


## Messages table
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|number|integer|null: false|
|user|references|null: false, foreign_key: true|
|room|references|null: false, foreign_key: true|
|message|text|

### Association
- belongs_to :user
- belongs_to :room


## Follows table
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|followable|references|null: false, foreign_key: true|
|follower|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## Tweets table
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user|references|null: false,foreign_key: true|
|tweet|text|

### Association
- belongs_to :user


## Comments table
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user|references|null: false,foreign_key: true|
|tweet|references|null: false,foreign_key: true|
|text|text|

### Association
- belongs_to :user
- belongs_to :tweet


## enum
- enum users, :status


## ER図

<img width="927" alt="92f653751abd86709fdd467e6c1c24ea" src="https://user-images.githubusercontent.com/52365507/63916929-628dfb80-ca74-11e9-8cb2-2507894590f9.png">

