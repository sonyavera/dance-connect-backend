class LikesController < ApplicationController

    private 
    
    def likes_params
        params.require(:likes).permit(:user_id, :comment_id)
    end
end
