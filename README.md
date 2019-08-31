# README

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

