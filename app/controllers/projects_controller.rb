class ProjectsController < ApplicationController
skip_before_action :require_admin, only: [:index]
  def index
    if @admin
      @articles = Article.where(layout: "project")
    else
      @articles = Article.where(online: true,
                                layout: "project")
    end
  end
  def show
    @article = Article.find(params[:id])
    @filepath = "texts/projects/#{@article.filename}.html"
  end
private
  def set_menu
    @menu_item = "projects-menu"
  end
end
