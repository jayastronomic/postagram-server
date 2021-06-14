
module Api 
    module V1 
     class UserSerializer < ActiveModel::Serializer
      include Rails.application.routes.url_helpers
      attributes :id, :username, :full_name, :avatar_attached, :avatar_url, :followed_user, :followed_you, :num_of_followers, :num_of_followings

      def avatar_attached
        object.avatar.attached?
      end

      def avatar_url
        if object.avatar.attached?
          url_for(object.avatar)
        else
          nil
        end
      end

       def followed_user
        Follow.where(follower_id: @instance_options[:current_user_id], followed_user_id: object.id).exists?
       end 
       
       def followed_you
        Follow.where(follower_id: object.id , followed_user_id: @instance_options[:current_user_id]).exists?
       end

       def num_of_followers
        object.followers.count
       end

       def num_of_followings
        object.followings.count
       end

       
     end
  end
end