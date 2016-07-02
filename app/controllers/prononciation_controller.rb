class PrononciationController < ArticlesController
skip_before_action :require_admin, only: [:index, :show]
  def index
    if @admin
      @articles = Article.where(layout: "prononciation")
    else
      @articles = Article.where(online: true,
                                layout: "prononciation")
    end
    render 'layouts/not_implemented' if @articles.length == 0
  end
  def show
    @article = Article.find(params[:id])
    @filepath = "texts/prononciation/#{@article.filename}.html"
  end
private
  def set_menu
    @menu_item = "prononciation-menu"
  end
end
