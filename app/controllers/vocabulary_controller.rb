class VocabularyController < ApplicationController
skip_before_action :require_admin, only: [:index]
  def index
    if @admin
      @articles = Article.where(layout: "vocabulary")
    else
      @articles = Article.where(online: true,
                                layout: "vocabulary")
    end
  end
  def show
    @article = Article.find(params[:id])
    @filepath = "texts/vocabulary/#{@article.filename}.html"
  end
private
  def set_menu
    @menu_item = "voc-menu"
  end
end

