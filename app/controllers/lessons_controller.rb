class LessonsController < ArticlesController 
# See article's controller
skip_before_action :require_admin, only: [:index, :show]
before_action :set_menu, only: [:index, :show]

  def index
    @articles = Article.where(online: true, layout: "lesson")
    render 'layouts/not_implemented' if @articles.length == 0
  end
  def show
    @article = Article.find(params[:id])
    require_admin unless @article.online
  end
private
  def set_menu
  # See ActionController
    @menu_item = "lessons-menu"
  end
end
