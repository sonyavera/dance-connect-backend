class CommentsController < ApplicationController
    before_action :find_commentable

    def new
        comment = Comment.new
    end


    def create
        comment = commentable.comments.create(comment_params)
        render json: {new_comment: comment}, status: :created
    end



    private

    def comment_params
        params.require(:comment).permit(:body)
    end


    def find_commentable
        commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
        commentable = DanceClass.find_by_id(params[:dance_class_id]) if params[:dance_class:id]
    end







end