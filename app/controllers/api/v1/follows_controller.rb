module Api
    module V1
        class FollowsController < ApplicationController

            def create 
                if already_followed?
                    render json: { status: "ALREADY_FOLLOWED", follow_id: @follow.id }
                else
                    follow = Follow.new(follow_params)
                    follow.save
                    render json: follow
                end
            end

            def destroy
                follow = Follow.find(params[:id])
                follow.destroy
                render json: { status: "UNFOLLOWED"}
            end


            private 

            def follow_params
                params.require(:user).permit(
                    :follower_id,
                    :followed_user_id
                )
            end

            def already_followed?
                @follow = Follow.find_by(follow_params)
            end

        end
    end
end
