class RemarksController < ApplicationController
skip_before_action :require_admin, only: [:index, :show]
  def index
  end

  def show
  end

  def new
    @article = Article.find(params[:article_id])
    @writing = @article.writings.find(params[:writing_id])
    @remark = @writing.remarks.new
  end

  def create
    @article = Article.find(params[:article_id])
    @writing = @article.writings.find(params[:writing_id])
    @remark = @writing.remarks.create(remark_params)
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @writing = @article.writings.find(params[:writing_id])
    @remark = @writing.remarks.find(params[:id]) 
  end

  def update
    @article = Article.find(params[:article_id])
    @writing = @article.writings.find(params[:writing_id])
    @remark = @writing.remarks.update(params[:id], remark_params) 
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @writing = @article.writings.find(params[:writing_id])
    @remark = @writing.remarks.find(params[:id]) 
    @remark.destroy
    redirect_to article_path(@article)
  end

private
  def remark_params
    params.require(:remark).permit(:title, :body, :category)
  end
end

