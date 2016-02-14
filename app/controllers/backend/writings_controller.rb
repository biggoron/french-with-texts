class Backend::WritingsController < WritingsController
  http_basic_authenticate_with name: "frodo", password: "thering"

  def show
  end

  def new
    @article = Article.find(params[:article_id])
    render 'writings/new'
  end

  def create
    @article = Article.find(params[:article_id])
    @writing = @article.writings.create(writing_params)
    redirect_to edit_backend_article_path(@article)
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def writing_params
    params.require(:writing).permit(:abs_lvl, :rel_lvl,
                                    :body, :tanslation)
  end
end
