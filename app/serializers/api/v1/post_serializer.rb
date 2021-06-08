
module Api 
    module V1 
     class PostSerializer < ActiveModel::Serializer
      attributes :id, :content, :post_user, :user_full_name, :user_id, :liked_by_current_user, :post_like_id, :number_of_likes
   
      def post_user
        object.user.username
      end

      def user_full_name
        object.user.full_name
      end

    

      def liked_by_current_user
        Like.where(post_id: object.id, user_id: @instance_options[:current_user_id]).exists?
      end

      def post_like_id
        if liked_by_current_user
          like = Like.find_by(post_id: object.id, user_id: @instance_options[:current_user_id])
          like.id
        end
      end

      def number_of_likes
        object.liked_by.length
      end


  
      # def user_avatar
      #   object.user.avatar.name
      # end
     end
    end
  end