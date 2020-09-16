class CommentsController < ApplicationController


    private 
    
    def comment_params
        params.require(:comment).permit(:user_id, :dance_class_id, :text)
    end


end
