
module Api 
    module V1 
     class PostSerializer < ActiveModel::Serializer
      attributes :id, :content, :post_user, :user_id
   
      def post_user
        object.user.username
      end
  
      # def user_avatar
      #   object.user.avatar.name
      # end
     end
    end
  end