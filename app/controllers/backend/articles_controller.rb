class Backend::ArticlesController < ArticlesController
  http_basic_authenticate_with name: "frodo", password: "thering"

  def new
    @article = Article.new
    puts @article.id
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to action: :show, id: @article.id
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to action: :show, id: @article.id
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to backend_articles_path
  end

  def session_destroy
    reset_session
    redirect_to articles_path
  end
private
  def article_params
    other_params = {}
    other_params[:online] = 1
    other_params[:layout] = 0 
    other_params.merge(params.require(:article).permit(:title))
  end
  def is_admin?
    return true
  end
end

