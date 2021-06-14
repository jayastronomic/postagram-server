class User < ApplicationRecord
    has_many :posts, dependent: :destroy

    # Will return an array of follows for the given user instance
    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"

    # Will return an array of users who follow the user instance
    has_many :followers, through: :received_follows, source: :follower

     # returns an array of follows a user gave to someone else
    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
  
    # returns an array of other users who the user has followed
    has_many :followings, through: :given_follows, source: :followed_user
    
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post, dependent: :destroy

    has_one_attached :avatar

    has_secure_password

    validates :full_name, presence: true
    validates :username, length: { in: 1..15}
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, format: { with:  /\A[a-zA-Z0-9 ]+\z/ }
    validates :username, length: { minimum: 1 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end