class CommentsController < ApplicationController
    def create
        @post=Post.find(params[:post_id])
        @comment =@post.comments.build(comment_params)
        @comment.user = current_user
        
        
        raise params.to_json

        respond_to do |format|
            if @comment.save
                format.html { redirect_to post_url(@comment.post), notice: "Comment was successfully created." }
                format.json { render :show, status: :created, location: @comment }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
end

private 

def comment_params
    params.require(:comment).permit(:body, :post_id)
end
end
