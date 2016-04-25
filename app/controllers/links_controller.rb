class LinksController < ApplicationController
skip_before_action :require_admin, only: [:index]
  # GET /links
  # GET /links.json
  def index
    @links = Link.all
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

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to links_path
    else
      render 'edit'
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
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
      @menu_item = "links-menu"
    end
end
