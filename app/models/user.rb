class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :sex, presence: true
  validates :avatar, attached: true
  validates :profile, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  acts_as_followable
  acts_as_follower
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  enum status:{nonreleased: 0, released: 1}

  enum sex: { man: 1, woman: 2 }
      
end
