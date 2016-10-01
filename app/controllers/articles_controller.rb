class ArticlesController < ApplicationController
# No need to be admin to access the articles index or an
# article
# TODO: check if an offline article shows if accessed through
# url
#
# An article can only be show to lambda user, index of all
# articles is admin priviledge
skip_before_action :require_admin, only: [:show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    case @article.layout
    # set_menu is called on the show action of the called
    # controller. TODO: try to remove @menu_item assignment
    when "lesson"
      @menu_item = "lessons-menu"
      controller = :lessons
    when "resource"
      @menu_item = "resources-menu"
      controller = :resources
    when "link"
      @menu_item = "links-menu"
      controller = :links
    when "prononciation"
      @menu_item = "prononciation-menu"
      controller = :prononciation
    else
      redirect_to root_path
    end
    redirect_to url_for(controller: controller,
                       action: :show,
                       id: @article.id)
  end

  def new
    @article = Article.new
  end

  def create
    # At creation the article instance is created and a
    # folder is created in views/texts/articles to store its
    # text ressources
    @article = Article.new(article_params)
    #TODO: Add protection to avoid overwriting
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
  # See create action
    @article = Article.find(params[:id])
    #TODO: check if no name conflict
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    # The text folder is still here, TODO: make a rake task
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def online
    # Puts the article visible to non-admin users
    @article = Article.find(params[:id])
    @article.online = 1
    @article.save
    redirect_to articles_path
  end

  def offline
    # hide the article visible from non-admin users
    @article = Article.find(params[:id])
    @article.online = 0
    @article.save
    redirect_to articles_path
  end

  def packet_download
    apkg = params[:file]
    ext = params[:ext]
    if ext == "apkg"
      path = File.join(Rails.root, 'app', 'assets', 'apkg',
      "#{apkg}.apkg")
      send_file path, disposition: 'attachment' 
    else
      #TODO: make a 404
      send_file "/layouts/404.html",
                type: "text/html; charset=utf-8",
                status: 404
    end
  end
private
  def article_params
  # Get the form data when creating or updating article
    other_params = {}
    # By default the article is offline (see offline action)
    other_params[:online] = 0
    # 0 corresponds to a default article, should be changed
    # when i will have many kinds of articles
    # Merges decided and chosen parameters
    other_params.merge(
      params.require(:article).permit(:layout, :title, :filename, :image_name)
    )
  end

  def set_menu
  # Called upon each action (behavior inhereted from action
  # controller), it set the menu on the left of the page
    @menu_item = "texts-menu"
  end
end
