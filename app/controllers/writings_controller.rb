class WritingsController < ApplicationController
skip_before_action :require_admin, only: [:index, :show]
  def show
    @article = Article.find(params[:article_id])
    @writing = @article.writings.find(params[:id]) 
  end

  def new
    @article = Article.find(params[:article_id])
    @writing = @article.writings.new
  end

  def create
    @article = Article.find(params[:article_id])
    @writing = @article.writings.create(writing_params)
    redirect_to edit_article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @writing = @article.writings.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @writing = @article.writings.update(params[:id],
                                        writing_params)
    redirect_to edit_article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @writing = @article.writings.find(params[:id])
    @writing.destroy
    redirect_to edit_article_path(@article)
  end
private
  def writing_params
    params.require(:writing).permit(:abs_lvl,
                                    :rel_lvl,
                                    :body,
                                    :translation)
  end
end

