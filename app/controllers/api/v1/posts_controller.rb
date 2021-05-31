module Api 
    module V1
        class PostsController < ApplicationController
            def index
                posts = Post.order('created_at DESC')
                render json: posts, current_user_id: current_user.id
            end

            def create
                post = Post.new(post_params)
                post.user = current_user
                post.save
                render json: post
            end

            def destroy
                post = Post.find(params[:id])
                post.destroy
                render json: post
            end

            private

            def post_params
                params.require(:post).permit(
                    :content,
                )
            end
        end
    end
end