class EventsController < ApplicationController
# See article's controller
skip_before_action :require_admin, only: [:index]

  def index
  # Nothing here yet
    if @admin
      @articles = Article.where(layout: "event")
    else
      @articles = Article.where(layout: "event",
                              online: true)
    end
    render 'layouts/not_implemented' if @articles.length == 0
  end
  def show
    @article = Article.find(params[:id])
    @filepath = "texts/events/#{@article.filename}.html"
  end
private
  def set_menu
  # See ActionController
    @menu_item = "events-menu"
  end
end

