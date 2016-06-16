class LinksController < ApplicationController
# See article's controller
skip_before_action :require_admin, only: [:index, :show]

  def index
    if @admin
      @articles = Article.where(layout: "link")
    else
      @articles = Article.where(online: true,
                                layout: "link")
    end
  end

  def show
    @article = Article.find(params[:id])
    @filepath = "texts/links/#{@article.filename}"
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path
    else
      render 'new'
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to links_path
    else
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_path
  end

  private
    def link_params
      params.require(:link).permit(:title, :description, :address)
    end

    def set_menu 
  # See ActionController
      @menu_item = "links-menu"
    end
end
