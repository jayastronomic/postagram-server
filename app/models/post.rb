class Post < ApplicationRecord
    belongs_to :user

    scope :of_followed_users, -> (following_users) { where user_id: following_users }

    has_many :likes, dependent: :destroy
    has_many :liked_by, through: :likes, source: :user, dependent: :destroy

    validates :content, presence: true
    validates :content, length: { in: 1..200 }


    # def liked_by_current_user?
    #     current_user = User.find(params[:id])
    #  return self.liked_by.ids.any?(current _user.id)
    # end
    
end