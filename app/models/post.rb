class Post < ApplicationRecord
    belongs_to :user

    validates :content, presence: true
    validates :content, length: { in: 1..200 }
    
end