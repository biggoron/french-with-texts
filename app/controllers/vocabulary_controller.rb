class VocabularyController < ArticlesController 
skip_before_action :require_admin, only: [:index, :show]
  def index
    if @admin
      @articles = Article.where(layout: "vocabulary")
    else
      @articles = Article.where(online: true,
                                layout: "vocabulary")
    end
    render 'layouts/not_implemented' if @articles.length == 0
  end
  def show
    @article = Article.find(params[:id])
    @filepath = "texts/vocabulary/#{@article.filename}"
  end
private
  def set_menu
    @menu_item = "voc-menu"
  end
end

