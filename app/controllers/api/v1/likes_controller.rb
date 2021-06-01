module Api
    module V1
        class LikesController < ApplicationController




            def index 
                user = current_user 
                user_liked_posts = user.liked_posts
                render json: user_liked_posts, current_user_id: user.id
            end


            def create
                if already_liked?
                    render json: {status: "ALREADY_LIKED", like_id: @like.id }
                else
                    like = Like.new(like_params)
                    like.save
                    render json: like
                end 
            end 


            def destroy
                like = Like.find(params[:id])
                like.destroy
                render json: like
            end







            # def create 
            #     @new_favorite_post = FavoritePost.new(favorite_params)
            #     user_favorited_posts_ids = @new_favorite_post.user.favorites.ids
            #     if user_favorited_posts_ids.any?(@new_favorite_post.post.id)
            #        already_favorited
            #     else 
            #         @new_favorite_post.save
            #         render json: @new_favorite_post
            #     end
            # end


            private 

            def like_params
                params.require(:user).permit(
                    :post_id,
                    :user_id
                )
            end

            def already_liked?
               @like = Like.find_by(like_params)
            end

        end 
    end
end