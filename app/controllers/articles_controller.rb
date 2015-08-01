class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.where(:uri => params[:id]).first
  end
end
