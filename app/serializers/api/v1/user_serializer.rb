
module Api 
    module V1 
     class UserSerializer < ActiveModel::Serializer
      include Rails.application.routes.url_helpers
      attributes :id, :username, :full_name, :avatar_attached, :avatar_url

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
     end
  end
end