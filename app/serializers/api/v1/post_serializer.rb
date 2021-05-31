
module Api 
    module V1 
     class PostSerializer < ActiveModel::Serializer
      attributes :id, :content, :post_user, :user_id, :liked_by_current_user
   
      def post_user
        object.user.username
      end

    

      def liked_by_current_user
        Like.where(post_id: object.id, user_id: @instance_options[:current_user_id]).exists?
      end


  
      # def user_avatar
      #   object.user.avatar.name
      # end
     end
    end
  end