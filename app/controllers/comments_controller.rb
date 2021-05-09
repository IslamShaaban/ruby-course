class CommentsController < ApplicationController
        
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.commenter = current_user.email
        @comment.save
        redirect_to article_path(@article)
    end
     
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        if @comment.commenter == current_user.email
            @comment.destroy
            redirect_to article_path(@article)
        else
            redirect_to article_path(@article)
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end