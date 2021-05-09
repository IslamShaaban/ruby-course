class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def create
        @article = Article.new(article_params)
        @article.save
        redirect_to @article
    end

    def show
        @article = Article.find(params[:id])
    end
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        @article.update({
          title: params[:article][:title],
          content: params[:article][:content],
        })

        if (@article)
          redirect_to url_for(:controller => :articles, :action => :index)
        else
          redirect_to url_for(:controller => :articles, :action => :edit)
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    end

    private
        def article_params
            params.require(:article).permit(:title, :content)
        end 
end