
module Api 
    module V1 
     class PostSerializer < ActiveModel::Serializer
      attributes :id, :content, :post_user, :user_avatar
  
      def post_user
        object.user.username
      end
  
      def user_avatar
        object.user.avatar
      end
     end
    end
  end