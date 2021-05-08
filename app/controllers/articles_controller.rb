class ArticlesController < ApplicationController
    
    def index 
    end

    def create
        @name = 'islamshaaban'
        puts params[:article].inspect.title
        render 'articles/index'
    end
end