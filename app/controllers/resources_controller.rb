class ResourcesController < ArticlesController 
# See article's controller
skip_before_action :require_admin, only: [:index, :show, :packet_download]
before_action :set_menu, only: [:index, :show]

  def index
    @articles = Article.where(online: true, layout: "resource")
  end

  def show
    @article = Article.find(params[:id])
    @menu_item = "resources-menu"
  end

  # GET /links/new
  def new
    @resource = Article.new
  end

  # GET /links/1/edit
  def edit
    @resource = Article.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    @resource = Article.new(link_params)
    if @resource.save
      redirect_to resources_path
    else
      render 'new'
    end
  end

  def update
    @resource = Article.find(params[:id])
    if @resource.update(resource_params)
      redirect_to resources_path
    else
      render 'edit'
    end
  end

  def destroy
    @resource = Article.find(params[:id])
    @resource.destroy
    redirect_to resources_path
  end


  private
    def resource_params
      params.require(:resource).permit(:title, :description, :address)
    end

    def set_menu 
  # See ActionController
      @menu_item = "resources-menu"
    end
end

