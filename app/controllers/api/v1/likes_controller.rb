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