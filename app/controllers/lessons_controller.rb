class LessonsController < ApplicationController
# See article's controller
skip_before_action :require_admin, only: [:index]

  def index
    if @admin
      @articles = Article.where(layout: "lesson")
    else
      @articles = Article.where(online: true,
                                layout: "lesson")
    end
  end
  def show
    @article = Article.find(params[:id])
    @filepath = "texts/lessons/#{@article.filename}.html"
  end
private
  def set_menu
  # See ActionController
    @menu_item = "lessons-menu"
  end
end
