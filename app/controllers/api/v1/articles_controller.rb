class Api::V1::ArticlesController < Api::V1::ApplicationController
  before_action :authorized

  def index
    @articles = Article.where(user_id: @user.id)
    render :json => @articles
  end

  def show
    @article = Article.where(user_id: @user.id, id: params[:id]).first
    render :json => @article
  end
end
