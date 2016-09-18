class ArticlesController < ApplicationController
  def index
    @articles = Article.published
  end

  def show
    @article = Article.where(:uri => params[:id]).first
    set_meta @article.meta.attributes if @article.meta
  end
end
