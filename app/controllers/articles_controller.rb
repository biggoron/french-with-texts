class ArticlesController < ApplicationController
skip_before_action :require_admin, only: [:index, :show]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def online
    @article = Article.find(params[:id])
    @article.online = 1
    @article.save
    redirect_to articles_path
  end

  def offline
    @article = Article.find(params[:id])
    @article.online = 0
    @article.save
    redirect_to articles_path
  end
private
  def article_params
    other_params = {}
    other_params[:online] = 0
    other_params[:layout] = 0 
    other_params.merge(params.require(:article).permit(:title))
  end
end
