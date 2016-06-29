class GrammarController < ApplicationController
# See article's controller
skip_before_action :require_admin, only: [:index, :show]

  def index
    if @admin
      @articles = Article.where(layout: "grammar")
    else
      @articles = Article.where(online: true,
                                layout: "grammar")
    end
    render 'layouts/not_implemented' if @articles.length == 0
  end

  def show
    @article = Article.find(params[:id])
    @filepath = "texts/grammar/#{@article.filename}"
  end
private
  def set_menu
  # See ActionController
    @menu_item = "grammar-menu"
  end
end

