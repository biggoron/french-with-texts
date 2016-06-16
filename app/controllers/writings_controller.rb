class WritingsController < ApplicationController
# See article's controller
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
    adirname = @article.normalize
    @writing = @article.writings.create(writing_params)
    wdirname = @writing.rel_lvl.to_s
    dir_name = adirname + wdirname 
    FileUtils.mkdir_p(dir_name) unless File.directory?(dir_name)
    redirect_to edit_article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @writing = @article.writings.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    adirname = @article.normalize
    @writing = @article.writings.find(params[:id])
    wdirname = @writing.rel_lvl.to_s
    dir_name = adirname + wdirname 
    @writing = @article.writings.update(params[:id],
                                        writing_params)
    dest_name = adirname + @writing.rel_lvl.to_s
    FileUtils.mv(dir_name, dest_name)
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
    params.require(:writing).permit(:abs_lvl, :rel_lvl)
  end
end

